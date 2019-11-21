import json
from db import db, User,Apartment,Preference
from flask import Flask, request
import datetime

app = Flask(__name__)
db_filename = 'hackchallenge.db'

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///%s' % db_filename
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

db.init_app(app)
with app.app_context():
    db.create_all()

# Your routes here
@app.route('/api/apartments/',methods=['GET'])
def get_all_apartments():
    apartments = Apartment.query.all()
    res = {'success': True, 'data': [a.serialize() for a in apartments]}
    return json.dumps(res), 200

@app.route('/api/users/',methods=['GET'])
def get_all_users():
    users = User.query.all()
    res = {'success': True, 'data': [u.serialize() for u in users]}
    return json.dumps(res), 200

@app.route('/api/apartment/<int:apt_id>/', methods=['GET'])
def get_apartment(apt_id):
    apt = Apartment.query.filter_by(id=apt_id).first()
    if not apt:
        return json.dumps({'success': False, 'error': 'Apartment not found!'}), 404
    return json.dumps({'success': True, 'data': apt.serialize()}), 200

@app.route('/api/user/<int:user_id>/', methods=['GET'])
def get_user(user_id):
    user = User.query.filter_by(id=user_id).first()
    if not user:
        return json.dumps({'success': False, 'error': 'User not found!'}), 404
    return json.dumps({'success': True, 'data': user.serialize()}), 200

@app.route('/api/apartments/',methods=['POST'])
def create_apartment():
    post_body = json.loads(request.data)
    address = post_body.get('address','')
    name=  post_body.get('name','')
    location = post_body.get('location','')
    num_ppl = post_body.get('num_ppl',0)
    landlord = post_body.get('landlord','')
    apartment = Apartment(
        name = name,
        address = address,
        location = location,
        num_ppl = num_ppl,
        landlord = landlord
    )
    db.session.add(apartment)
    db.session.commit()
    return json.dumps({'success': True, 'data': apartment.serialize()}), 201

@app.route('/api/apartment/<int:apt_id>/', methods=['DELETE'])
def delete_apartment(apt_id):
    apartment = Apartment.query.filter_by(id=apt_id).first()
    if apartment is not None:
        db.session.delete(apartment)
        db.session.commit()
        return json.dumps({'success': True, 'data': apartment.serialize()}), 200
    return json.dumps({'success': False, 'error': 'Apartment not found!'}), 404

@app.route('/api/users/',methods=['POST'])
def create_user():
    post_body = json.loads(request.data)
    name=  post_body.get('name','')
    gender = post_body.get('gender','')
    year = post_body.get('year',1)
    user = User(
        name = name,
        gender = gender,
        year = year
    )
    db.session.add(user)
    db.session.commit()
    return json.dumps({'success': True, 'data': user.serialize()}), 201

@app.route('/api/user/<int:user_id>/',methods=['DELETE'])
def delete_user(user_id):
    user = User.query.filter_by(id=user_id).first()
    if user is not None:
        db.session.delete(user)
        db.session.commit()
        return json.dumps({'success':True,'data':user.serialize()}), 200
    return json.dumps({'success':False,'error':'User not found'}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
