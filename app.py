from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_mail import Mail
import json
import math
from werkzeug.utils import secure_filename
import os
with open('config.json', 'r') as c:
    parameters = json.load(c)["parameters"]
local_server =False
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=parameters['UserName'],
    MAIL_PASSWORD=parameters['Gmail-Password']
)
mail = Mail(app)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = parameters['local_uri']
db = SQLAlchemy(app)


class contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    phone_num = db.Column(db.String(12), nullable=False)
    mes = db.Column(db.String(120), nullable=False)
    email = db.Column(db.String(120), nullable=False)

    def __init__(self, name, phone_num, mes, email, date):
        self.name = name
        self.phone_num = phone_num
        self.msg = msg
        self.date = date
        self.email = email


class posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    tagline = db.Column(db.String(120), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    date = db.Column(db.String(12), nullable=True)

    def __init__(self, title, slug, content, date, tagline):
        self.title = title
        self.slug = slug
        self.content = content
        self.date = date
        self.tagline = tagline
'''
def updatesno(sno):
    eng = create_engine(parameters['local_uri'])
    with eng.connect() as con:
        rs = con.execute(f"UPDATE posts SET sno=sno-1 WHERE sno > {sno}")
    return "updated"
'''


@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts) / int(parameters['no_of_posts']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page - 1) * int(parameters['no_of_posts']):(page - 1) * int(parameters['no_of_posts']) + int(
        parameters['no_of_posts'])]
    if page == 1:
        prev = "#"
        next = "/?page=" + str(page + 1)
    elif (page == last):
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html', parameters=parameters, posts=posts, prev=prev, next=next)


@app.route("/about")
def about():
    return render_template('about.html')


@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():
    if "user" in session and session['user'] == parameters['admin_user']:
        posts = Posts.query.all()
        return render_template("dashboard.html", parameters=parameters, posts=posts)
    if request.method == "POST":
        username = request.form.get("uname")
        userpass = request.form.get("pass")
        if username == parameters['admin_user'] and userpass == parameters['admin_password']:
            # set the session variable
            session['user'] = username
            posts = Posts.query.all()
            return render_template("dashboard.html", parameters=parameters, posts=posts)
    return render_template('login.html', parameters=parameters)


@app.route("/contact", methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        name1 = request.form.get('name')
        email1 = request.form.get('email')
        phone_no1 = request.form.get('phone_no')
        mes1 = request.form.get('mes')
        entry = Contacts(name=name1, date=datetime.now(), phone_num=phone_no1, mes=mes1, email=email1)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' + name1,
                          sender=email1,
                          recipients=[parameters['UserName']],
                          body=mes1 + "\n" + phone_no1
                          )
    return render_template('contact.html')


@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if "user" in session and session['user'] == parameters['admin_user']:
        if request.method == "POST":
            box_title = request.form.get('title')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            date = datetime.now()
            if sno == '0':
                post = Posts(title=box_title, slug=slug, content=content, tagline=tline, date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.tagline = tline
                post.slug = slug
                post.content = content
                post.date = date
                db.session.commit()
                return redirect('/edit/' + sno)
    post = Posts.query.filter_by(sno=sno).first()
    return render_template('edit.html', parameters=parameters, post=post, sno=sno)


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route("/delete/<string:sno>", methods=['GET', 'POST'])
def delete(sno):
    if "user" in session and session['user'] == parameters['admin_user']:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect("/dashboard")


@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', parameters=parameters, post=post)


if __name__ == '__main__':
    app.run(debug=True)
