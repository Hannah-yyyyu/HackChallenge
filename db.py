import sqlite3 
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

association_table = db.Table('association',db.Model.metadata,
    db.Column('user_id',db.Integer,db.ForeignKey('user.id')),
    db.Column('apartment_id',db.Integer,db.ForeignKey('apartment.id'))
)

class User(db.Model):
    __tablename__=  'user'  
    id =  db.Column(db.Integer,primary_key=True)
    name = db.Column(db.String,nullable=False)
    gender = db.Column(db.String,nullable=False)
    year = db.Column(db.Integer,nullable=False)
    preferences = db.relationship('Preference',cascade = 'delete')
    # liked_apts = db.relationship('Apartment',cascade='delete')
    apt_matches = db.relationship('Apartment',secondary = association_table, back_populates = 'user_matches')
    # apt_id = db.Column(db.Integer,db.ForeignKey('apartment.id'),nullable=False)

    def __init__(self,**kwargs):
        self.name = kwargs.get('name','') #default  give ''
        self.gender = kwargs.get('gender','')
        self.year = kwargs.get('year',1)
        self.preferences = []
        # self.liked_apts=[]

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'gender': self.gender,
            'preferences': [p.serialize() for p in self.preferences],
            'apt_matches': [a.serialize() for a in  self.apt_matches]
        }

class Preference(db.Model):
    __tablename__=  'preference'  
    id =  db.Column(db.Integer,primary_key=True)
    pricerange_low = db.Column(db.Integer,nullable=False)
    pricerange_high = db.Column(db.Integer,nullable=False)
    location = db.Column(db.String,nullable=False)
    num_ppl = db.Column(db.Integer,nullable=False)
    quiet_social = db.Column(db.Boolean,nullable=False)
    cleanliness = db.Column(db.Boolean,nullable=False)
    user_id = db.Column(db.Integer,db.ForeignKey('user.id'),nullable=False)

    def __init__(self,**kwargs):
        self.pricerange_low = kwargs.get('pricerange_low',0) #default  give ''
        self.pricerange_high = kwargs.get('pricerange_high',0)
        self.location = kwargs.get('location','')
        self.num_ppl = kwargs.get('num_ppl',0)
        self.quiet_social = kwargs.get('quiet_social',False)
        self.cleanliness = kwargs.get('cleanliness',False)

    def serialize(self):
        return {
            'id': self.id,
            'pricerange_low': self.pricerange_low,
            'pricerange_high': self.pricerange_high,
            'location': self.location,
            'num_ppl': self.num_ppl,
            'quiet_social': self.quiet_social,
            'cleanliness': self.cleanliness
        }
    
    def get_user(self):
        user = User.query.filter_by(id=self.user_id).first()
        return {
            'user': [user.serialize()]
        }
    
    def update_pricerange_low(self,pricerange_low):
        self.pricerange_low=pricerange_low
    def update_pricerange_high(self,pricerange_high):
        self.pricerange_high=pricerange_high
    def update_location(self,location):
        self.location=location
    def update_num_ppl(self,num_ppl):
        self.num_ppl=num_ppl
    def update_quiet_social(self,quiet_social):
        self.quiet_social=quiet_social
    def update_cleanliness(self,cleanliness):
        self.cleanliness=cleanliness

class Apartment(db.Model):
    __tablename__=  'apartment' 
    id =  db.Column(db.Integer,primary_key=True)
    address = db.Column(db.String,nullable=False)
    location = db.Column(db.String,nullable=False)
    name = db.Column(db.String,nullable=False)
    num_ppl = db.Column(db.Integer,nullable=False)
    # features = db.Column(db.String,nullable=False)
    landlord = db.Column(db.String,nullable=False)
    # liked_users = db.relationship('User',cascade='delete')
    user_matches = db.relationship('User',secondary = association_table, back_populates = 'apt_matches')
    # user_id = db.Column(db.Integer,db.ForeignKey('user.id'),nullable=False)

    def __init__(self,**kwargs):
        self.name = kwargs.get('name','')
        self.address=kwargs.get('address','')
        self.location=kwargs.get('location','')
        self.num_ppl=kwargs.get('num_ppl',0)
        self.landlord=kwargs.get('landlord','')
        # self.liked_users= []

    def serialize(self):
        return {
            'id': self.id,
            'name':self.name,
            'address': self.address,
            'num_ppl': self.num_ppl,
            'location': self.location,
            'landlord': self.landlord,
            # 'liked_users': [u.serialize() for u in  self.liked_users],
            'user_matches': [u.serialize() for u in  self.user_matches]
        }