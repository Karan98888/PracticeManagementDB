PGDMP     4    +    
            {            PracticeManagementDB    14.1    14.1 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    17065    PracticeManagementDB    DATABASE     z   CREATE DATABASE "PracticeManagementDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
 &   DROP DATABASE "PracticeManagementDB";
                postgres    false            
            2615    17066    allergy    SCHEMA        CREATE SCHEMA allergy;
    DROP SCHEMA allergy;
                postgres    false                        2615    25948    appointment    SCHEMA        CREATE SCHEMA appointment;
    DROP SCHEMA appointment;
                postgres    false            	            2615    17069    master    SCHEMA        CREATE SCHEMA master;
    DROP SCHEMA master;
                postgres    false                        2615    17071    notes    SCHEMA        CREATE SCHEMA notes;
    DROP SCHEMA notes;
                postgres    false                        2615    17072    patient    SCHEMA        CREATE SCHEMA patient;
    DROP SCHEMA patient;
                postgres    false                        2615    25868    token    SCHEMA        CREATE SCHEMA token;
    DROP SCHEMA token;
                postgres    false                        2615    17074    users    SCHEMA        CREATE SCHEMA users;
    DROP SCHEMA users;
                postgres    false                        2615    17075    visitor    SCHEMA        CREATE SCHEMA visitor;
    DROP SCHEMA visitor;
                postgres    false                       1255    17477    getpatientrecord() 	   PROCEDURE     z   CREATE PROCEDURE public.getpatientrecord()
    LANGUAGE plpgsql
    AS $$
begin

Select * from patient.patients;

end;$$;
 *   DROP PROCEDURE public.getpatientrecord();
       public          postgres    false                       1255    17478    getpatientrecord(integer) 	   PROCEDURE     �   CREATE PROCEDURE public.getpatientrecord(IN id integer)
    LANGUAGE plpgsql
    AS $$
begin

Select * from patient.patients where patientid = id;

end;$$;
 7   DROP PROCEDURE public.getpatientrecord(IN id integer);
       public          postgres    false                       1255    17498 V   insert_allergyrecord(integer, character varying, character varying, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.insert_allergyrecord(IN allergytype integer, IN allergyname character varying, IN allergydescription character varying, IN allergyclinicalinformation character varying)
    LANGUAGE plpgsql
    AS $$
begin

insert into allergy.allergy(allergytype, allergyname, allergydescription, allergyclinicalinformation)
values (allergytype, allergyname, allergydescription, allergyclinicalinformation);

end;
$$;
 �   DROP PROCEDURE public.insert_allergyrecord(IN allergytype integer, IN allergyname character varying, IN allergydescription character varying, IN allergyclinicalinformation character varying);
       public          postgres    false                       1255    17501 {   insert_patientrecord(integer, character varying, character varying, character varying, integer, integer, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.insert_patientrecord(IN patientid integer, IN race character varying, IN ethnicity character varying, IN languages character varying, IN patientrelationshipid integer, IN allergyid integer, IN address character varying)
    LANGUAGE plpgsql
    AS $$
begin

insert into patient.patients(patientid, race, ethnicity, languages, patientrelationshipid, allergyid, address)
values (patientid, race, ethnicity, languages, patientrelationshipid, allergyid, address);

end;
$$;
 �   DROP PROCEDURE public.insert_patientrecord(IN patientid integer, IN race character varying, IN ethnicity character varying, IN languages character varying, IN patientrelationshipid integer, IN allergyid integer, IN address character varying);
       public          postgres    false                        1259    26007    allergy    TABLE       CREATE TABLE allergy.allergy (
    id integer NOT NULL,
    allergyid character varying(200),
    allergytype character varying(200),
    allergyname character varying(100),
    allergydescription character varying(500),
    allergyclinicalinformation character varying(500)
);
    DROP TABLE allergy.allergy;
       allergy         heap    postgres    false    10            �            1259    26006    allergy_id_seq    SEQUENCE     �   CREATE SEQUENCE allergy.allergy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE allergy.allergy_id_seq;
       allergy          postgres    false    256    10                       0    0    allergy_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE allergy.allergy_id_seq OWNED BY allergy.allergy.id;
          allergy          postgres    false    255                       1259    34067    appointmenthistory    TABLE     d  CREATE TABLE appointment.appointmenthistory (
    id integer NOT NULL,
    appointmentid integer NOT NULL,
    userid integer NOT NULL,
    appointmentdate date NOT NULL,
    starttime timestamp without time zone,
    endtime timestamp without time zone,
    reason character varying(500),
    createdon timestamp without time zone DEFAULT CURRENT_DATE
);
 +   DROP TABLE appointment.appointmenthistory;
       appointment         heap    postgres    false    12                       1259    34066    appointmenthistory_id_seq    SEQUENCE     �   CREATE SEQUENCE appointment.appointmenthistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE appointment.appointmenthistory_id_seq;
       appointment          postgres    false    12    259                       0    0    appointmenthistory_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE appointment.appointmenthistory_id_seq OWNED BY appointment.appointmenthistory.id;
          appointment          postgres    false    258            �            1259    25952    appointments    TABLE       CREATE TABLE appointment.appointments (
    id integer NOT NULL,
    patientid integer,
    meetingtitle character varying(100),
    description character varying(500),
    physicianid integer,
    appointmentdate date,
    starttime timestamp without time zone,
    endtime timestamp without time zone,
    status integer,
    appointmentrescheduledate date,
    createdby integer,
    createdon timestamp without time zone DEFAULT CURRENT_DATE,
    updatedby integer,
    updatedon timestamp without time zone DEFAULT CURRENT_DATE
);
 %   DROP TABLE appointment.appointments;
       appointment         heap    postgres    false    12                       1259    26023    appointments_id_seq    SEQUENCE     �   CREATE SEQUENCE appointment.appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 /   DROP SEQUENCE appointment.appointments_id_seq;
       appointment          postgres    false    12            �            1259    17103 	   diagnosis    TABLE     �   CREATE TABLE master.diagnosis (
    id integer NOT NULL,
    code character varying(100),
    description character varying(500),
    isdepricated boolean DEFAULT false
);
    DROP TABLE master.diagnosis;
       master         heap    postgres    false    9            �            1259    17108 "   diagnosiscodeanddescription_id_seq    SEQUENCE     �   CREATE SEQUENCE master.diagnosiscodeanddescription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE master.diagnosiscodeanddescription_id_seq;
       master          postgres    false    9    217                       0    0 "   diagnosiscodeanddescription_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE master.diagnosiscodeanddescription_id_seq OWNED BY master.diagnosis.id;
          master          postgres    false    218            �            1259    25805    drugdata    TABLE     )  CREATE TABLE master.drugdata (
    id integer NOT NULL,
    drugid character varying(100) NOT NULL,
    drugname character varying(200) NOT NULL,
    druggenericname character varying(200),
    drugbrandname character varying(100),
    drugstrength character varying(100),
    drugform integer
);
    DROP TABLE master.drugdata;
       master         heap    postgres    false    9            �            1259    25804    drugdata_id_seq    SEQUENCE     �   CREATE SEQUENCE master.drugdata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE master.drugdata_id_seq;
       master          postgres    false    9    246                       0    0    drugdata_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE master.drugdata_id_seq OWNED BY master.drugdata.id;
          master          postgres    false    245            �            1259    17109    drugform    TABLE     [   CREATE TABLE master.drugform (
    id integer NOT NULL,
    form character varying(100)
);
    DROP TABLE master.drugform;
       master         heap    postgres    false    9            �            1259    17112    drugform_id_seq    SEQUENCE     �   CREATE SEQUENCE master.drugform_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE master.drugform_id_seq;
       master          postgres    false    219    9                       0    0    drugform_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE master.drugform_id_seq OWNED BY master.drugform.id;
          master          postgres    false    220            �            1259    17113 	   procedure    TABLE     �   CREATE TABLE master.procedure (
    id integer NOT NULL,
    code character varying(100),
    description character varying(500),
    isdepricated boolean DEFAULT false
);
    DROP TABLE master.procedure;
       master         heap    postgres    false    9            �            1259    17118 "   procedurecodeanddescription_id_seq    SEQUENCE     �   CREATE SEQUENCE master.procedurecodeanddescription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE master.procedurecodeanddescription_id_seq;
       master          postgres    false    9    221                       0    0 "   procedurecodeanddescription_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE master.procedurecodeanddescription_id_seq OWNED BY master.procedure.id;
          master          postgres    false    222            �            1259    17119 
   procedures    TABLE     -  CREATE TABLE master.procedures (
    id integer NOT NULL,
    code character varying(100),
    description character varying(500),
    isdepricated boolean DEFAULT false,
    createdby integer,
    createdon date DEFAULT CURRENT_DATE,
    updatedby integer,
    updatedon date DEFAULT CURRENT_DATE
);
    DROP TABLE master.procedures;
       master         heap    postgres    false    9            �            1259    17127    procedures_id_seq    SEQUENCE     �   CREATE SEQUENCE master.procedures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE master.procedures_id_seq;
       master          postgres    false    223    9                       0    0    procedures_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE master.procedures_id_seq OWNED BY master.procedures.id;
          master          postgres    false    224            �            1259    17128    relationship    TABLE     _   CREATE TABLE master.relationship (
    id integer NOT NULL,
    name character varying(100)
);
     DROP TABLE master.relationship;
       master         heap    postgres    false    9            �            1259    17131    relationship_id_seq    SEQUENCE     �   CREATE SEQUENCE master.relationship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE master.relationship_id_seq;
       master          postgres    false    9    225                       0    0    relationship_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE master.relationship_id_seq OWNED BY master.relationship.id;
          master          postgres    false    226            �            1259    17132    roles    TABLE     X   CREATE TABLE master.roles (
    id integer NOT NULL,
    name character varying(100)
);
    DROP TABLE master.roles;
       master         heap    postgres    false    9            �            1259    17135    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE master.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE master.roles_id_seq;
       master          postgres    false    9    227                        0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE master.roles_id_seq OWNED BY master.roles.id;
          master          postgres    false    228            �            1259    25921    status    TABLE     a   CREATE TABLE master.status (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);
    DROP TABLE master.status;
       master         heap    postgres    false    9            �            1259    25920    status_id_seq    SEQUENCE     �   CREATE SEQUENCE master.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE master.status_id_seq;
       master          postgres    false    251    9            !           0    0    status_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE master.status_id_seq OWNED BY master.status.id;
          master          postgres    false    250            �            1259    25884    userrole    TABLE     I   CREATE TABLE master.userrole (
    userid integer,
    roleid integer
);
    DROP TABLE master.userrole;
       master         heap    postgres    false    9            �            1259    17142    notes    TABLE     [  CREATE TABLE notes.notes (
    id integer NOT NULL,
    receiverid integer,
    senderid integer,
    message character varying(500),
    urgencylevel boolean DEFAULT false,
    noteviewdate date DEFAULT CURRENT_DATE,
    createdby integer,
    createdon date DEFAULT CURRENT_DATE,
    updatedby integer,
    updateon date DEFAULT CURRENT_DATE
);
    DROP TABLE notes.notes;
       notes         heap    postgres    false    5            �            1259    17151    notes_id_seq    SEQUENCE     �   CREATE SEQUENCE notes.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE notes.notes_id_seq;
       notes          postgres    false    5    229            "           0    0    notes_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE notes.notes_id_seq OWNED BY notes.notes.id;
          notes          postgres    false    230            �            1259    25695    emergencycontactinfo    TABLE       CREATE TABLE patient.emergencycontactinfo (
    id integer NOT NULL,
    title character varying(10),
    firstname character varying(100),
    lastname character varying(100),
    email character varying(100),
    contactnumber character varying(50),
    relationshipid integer,
    postalcode character varying(10),
    city character varying(100),
    state character varying(100),
    country character varying(100),
    accesspatientportal boolean DEFAULT false NOT NULL,
    address character varying(500)
);
 )   DROP TABLE patient.emergencycontactinfo;
       patient         heap    postgres    false    11            �            1259    25694    emergencycontactinfo_id_seq    SEQUENCE     �   CREATE SEQUENCE patient.emergencycontactinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE patient.emergencycontactinfo_id_seq;
       patient          postgres    false    238    11            #           0    0    emergencycontactinfo_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE patient.emergencycontactinfo_id_seq OWNED BY patient.emergencycontactinfo.id;
          patient          postgres    false    237            �            1259    25709    patientallergy    TABLE     �  CREATE TABLE patient.patientallergy (
    id integer NOT NULL,
    patientid integer,
    allergyid character varying(100),
    allergytype character varying(100),
    allergydescription text,
    allergyclinicalinformation text,
    allergyfatal boolean DEFAULT false NOT NULL,
    createdby integer,
    createdon date DEFAULT now(),
    updatedby integer,
    updatedon date DEFAULT now(),
    allergyname character varying(200),
    isactive boolean DEFAULT true NOT NULL
);
 #   DROP TABLE patient.patientallergy;
       patient         heap    postgres    false    11            �            1259    25708    patientallergy_id_seq    SEQUENCE     �   CREATE SEQUENCE patient.patientallergy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE patient.patientallergy_id_seq;
       patient          postgres    false    11    240            $           0    0    patientallergy_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE patient.patientallergy_id_seq OWNED BY patient.patientallergy.id;
          patient          postgres    false    239            �            1259    25778    patientdiagnosis    TABLE     T  CREATE TABLE patient.patientdiagnosis (
    id integer NOT NULL,
    patientvisitid integer,
    diagnosiscode character varying(100),
    diagnosisdescription character varying(500),
    isdepricated boolean DEFAULT false,
    createdby integer,
    createdon date DEFAULT now(),
    updatedby integer,
    updatedon date DEFAULT now()
);
 %   DROP TABLE patient.patientdiagnosis;
       patient         heap    postgres    false    11            �            1259    25777    patientdiagnosis_id_seq    SEQUENCE     �   CREATE SEQUENCE patient.patientdiagnosis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE patient.patientdiagnosis_id_seq;
       patient          postgres    false    11    244            %           0    0    patientdiagnosis_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE patient.patientdiagnosis_id_seq OWNED BY patient.patientdiagnosis.id;
          patient          postgres    false    243            �            1259    25814    patientmedication    TABLE     �  CREATE TABLE patient.patientmedication (
    id integer NOT NULL,
    patientvisitid integer,
    drugid character varying(100),
    drugname character varying(200),
    druggenericname character varying(200),
    drugbrandname character varying(100),
    drugform character varying(200),
    drugstrength character varying(100),
    createdby integer,
    createdon date DEFAULT now(),
    updatedby integer,
    updatedon date DEFAULT now()
);
 &   DROP TABLE patient.patientmedication;
       patient         heap    postgres    false    11            �            1259    25813    patientmedication_id_seq    SEQUENCE     �   CREATE SEQUENCE patient.patientmedication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE patient.patientmedication_id_seq;
       patient          postgres    false    248    11            &           0    0    patientmedication_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE patient.patientmedication_id_seq OWNED BY patient.patientmedication.id;
          patient          postgres    false    247            �            1259    25751    patientprocedure    TABLE     T  CREATE TABLE patient.patientprocedure (
    id integer NOT NULL,
    patientvisitid integer,
    procedurecode character varying(100),
    proceduredescription character varying(500),
    isdepricated boolean DEFAULT false,
    createdby integer,
    createdon date DEFAULT now(),
    updatedby integer,
    updatedon date DEFAULT now()
);
 %   DROP TABLE patient.patientprocedure;
       patient         heap    postgres    false    11            �            1259    25750    patientprocedure_id_seq    SEQUENCE     �   CREATE SEQUENCE patient.patientprocedure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE patient.patientprocedure_id_seq;
       patient          postgres    false    242    11            '           0    0    patientprocedure_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE patient.patientprocedure_id_seq OWNED BY patient.patientprocedure.id;
          patient          postgres    false    241            �            1259    17152    patients    TABLE     �  CREATE TABLE patient.patients (
    id integer NOT NULL,
    patientid integer,
    race character varying(100),
    ethnicity character varying(100),
    languages character varying(100),
    patientrelationshipid integer,
    allergyid integer,
    address character varying(100),
    isportalaccessible boolean DEFAULT false,
    createdby integer DEFAULT 1,
    createdon date DEFAULT CURRENT_DATE,
    updatedby integer DEFAULT 1,
    updatedon date DEFAULT CURRENT_DATE,
    city character varying(100),
    state character varying(100),
    country character varying(100),
    postalcode character varying(10),
    emergencycontactid integer
);
    DROP TABLE patient.patients;
       patient         heap    postgres    false    11            �            1259    17160    patients_id_seq    SEQUENCE     �   CREATE SEQUENCE patient.patients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE patient.patients_id_seq;
       patient          postgres    false    11    231            (           0    0    patients_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE patient.patients_id_seq OWNED BY patient.patients.id;
          patient          postgres    false    232            �            1259    25992    refreshtoken    TABLE     �   CREATE TABLE token.refreshtoken (
    refreshtokenid integer NOT NULL,
    token character varying(1000),
    jwtid character varying(1000),
    userid integer,
    createdon timestamp without time zone DEFAULT CURRENT_DATE
);
    DROP TABLE token.refreshtoken;
       token         heap    postgres    false    4            �            1259    25991    refreshtoken_refreshtokenid_seq    SEQUENCE     �   CREATE SEQUENCE token.refreshtoken_refreshtokenid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE token.refreshtoken_refreshtokenid_seq;
       token          postgres    false    254    4            )           0    0    refreshtoken_refreshtokenid_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE token.refreshtoken_refreshtokenid_seq OWNED BY token.refreshtoken.refreshtokenid;
          token          postgres    false    253            �            1259    17175    users    TABLE     �  CREATE TABLE users.users (
    id integer NOT NULL,
    title character varying(100),
    firstname character varying(100),
    lastname character varying(100),
    email character varying(100),
    password character varying(100),
    dateofbirth date,
    gender character varying(100),
    roleid integer,
    contactnumber character varying(40),
    isactive boolean DEFAULT true NOT NULL,
    invalidloginattempts integer,
    createdby integer,
    createdon timestamp without time zone DEFAULT CURRENT_DATE,
    updatedby integer,
    updatedon timestamp without time zone DEFAULT CURRENT_DATE,
    dateofjoining date,
    statusid integer DEFAULT 1 NOT NULL
);
    DROP TABLE users.users;
       users         heap    postgres    false    7            �            1259    17182    users_id_seq    SEQUENCE     �   CREATE SEQUENCE users.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE users.users_id_seq;
       users          postgres    false    233    7            *           0    0    users_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE users.users_id_seq OWNED BY users.users.id;
          users          postgres    false    234            �            1259    17183    vistorsinfo    TABLE       CREATE TABLE visitor.vistorsinfo (
    id integer NOT NULL,
    patientid integer,
    height numeric,
    weight numeric,
    bloodpressure numeric,
    bodytemprature numeric,
    respirationrate integer,
    createdby integer,
    createdon timestamp without time zone DEFAULT CURRENT_DATE,
    updatedby integer,
    updatedon timestamp without time zone DEFAULT CURRENT_DATE
);
     DROP TABLE visitor.vistorsinfo;
       visitor         heap    postgres    false    13            �            1259    17190    vistorsinfo_id_seq    SEQUENCE     �   CREATE SEQUENCE visitor.vistorsinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE visitor.vistorsinfo_id_seq;
       visitor          postgres    false    13    235            +           0    0    vistorsinfo_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE visitor.vistorsinfo_id_seq OWNED BY visitor.vistorsinfo.id;
          visitor          postgres    false    236                       2604    26010 
   allergy id    DEFAULT     j   ALTER TABLE ONLY allergy.allergy ALTER COLUMN id SET DEFAULT nextval('allergy.allergy_id_seq'::regclass);
 :   ALTER TABLE allergy.allergy ALTER COLUMN id DROP DEFAULT;
       allergy          postgres    false    256    255    256                       2604    34070    appointmenthistory id    DEFAULT     �   ALTER TABLE ONLY appointment.appointmenthistory ALTER COLUMN id SET DEFAULT nextval('appointment.appointmenthistory_id_seq'::regclass);
 I   ALTER TABLE appointment.appointmenthistory ALTER COLUMN id DROP DEFAULT;
       appointment          postgres    false    259    258    259            �           2604    17195    diagnosis id    DEFAULT     ~   ALTER TABLE ONLY master.diagnosis ALTER COLUMN id SET DEFAULT nextval('master.diagnosiscodeanddescription_id_seq'::regclass);
 ;   ALTER TABLE master.diagnosis ALTER COLUMN id DROP DEFAULT;
       master          postgres    false    218    217            �           2604    25808    drugdata id    DEFAULT     j   ALTER TABLE ONLY master.drugdata ALTER COLUMN id SET DEFAULT nextval('master.drugdata_id_seq'::regclass);
 :   ALTER TABLE master.drugdata ALTER COLUMN id DROP DEFAULT;
       master          postgres    false    245    246    246            �           2604    17196    drugform id    DEFAULT     j   ALTER TABLE ONLY master.drugform ALTER COLUMN id SET DEFAULT nextval('master.drugform_id_seq'::regclass);
 :   ALTER TABLE master.drugform ALTER COLUMN id DROP DEFAULT;
       master          postgres    false    220    219            �           2604    17197    procedure id    DEFAULT     ~   ALTER TABLE ONLY master.procedure ALTER COLUMN id SET DEFAULT nextval('master.procedurecodeanddescription_id_seq'::regclass);
 ;   ALTER TABLE master.procedure ALTER COLUMN id DROP DEFAULT;
       master          postgres    false    222    221            �           2604    17198    procedures id    DEFAULT     n   ALTER TABLE ONLY master.procedures ALTER COLUMN id SET DEFAULT nextval('master.procedures_id_seq'::regclass);
 <   ALTER TABLE master.procedures ALTER COLUMN id DROP DEFAULT;
       master          postgres    false    224    223            �           2604    17199    relationship id    DEFAULT     r   ALTER TABLE ONLY master.relationship ALTER COLUMN id SET DEFAULT nextval('master.relationship_id_seq'::regclass);
 >   ALTER TABLE master.relationship ALTER COLUMN id DROP DEFAULT;
       master          postgres    false    226    225            �           2604    17200    roles id    DEFAULT     d   ALTER TABLE ONLY master.roles ALTER COLUMN id SET DEFAULT nextval('master.roles_id_seq'::regclass);
 7   ALTER TABLE master.roles ALTER COLUMN id DROP DEFAULT;
       master          postgres    false    228    227                       2604    25924 	   status id    DEFAULT     f   ALTER TABLE ONLY master.status ALTER COLUMN id SET DEFAULT nextval('master.status_id_seq'::regclass);
 8   ALTER TABLE master.status ALTER COLUMN id DROP DEFAULT;
       master          postgres    false    250    251    251            �           2604    17202    notes id    DEFAULT     b   ALTER TABLE ONLY notes.notes ALTER COLUMN id SET DEFAULT nextval('notes.notes_id_seq'::regclass);
 6   ALTER TABLE notes.notes ALTER COLUMN id DROP DEFAULT;
       notes          postgres    false    230    229            �           2604    25698    emergencycontactinfo id    DEFAULT     �   ALTER TABLE ONLY patient.emergencycontactinfo ALTER COLUMN id SET DEFAULT nextval('patient.emergencycontactinfo_id_seq'::regclass);
 G   ALTER TABLE patient.emergencycontactinfo ALTER COLUMN id DROP DEFAULT;
       patient          postgres    false    237    238    238            �           2604    25712    patientallergy id    DEFAULT     x   ALTER TABLE ONLY patient.patientallergy ALTER COLUMN id SET DEFAULT nextval('patient.patientallergy_id_seq'::regclass);
 A   ALTER TABLE patient.patientallergy ALTER COLUMN id DROP DEFAULT;
       patient          postgres    false    240    239    240            �           2604    25781    patientdiagnosis id    DEFAULT     |   ALTER TABLE ONLY patient.patientdiagnosis ALTER COLUMN id SET DEFAULT nextval('patient.patientdiagnosis_id_seq'::regclass);
 C   ALTER TABLE patient.patientdiagnosis ALTER COLUMN id DROP DEFAULT;
       patient          postgres    false    243    244    244            �           2604    25817    patientmedication id    DEFAULT     ~   ALTER TABLE ONLY patient.patientmedication ALTER COLUMN id SET DEFAULT nextval('patient.patientmedication_id_seq'::regclass);
 D   ALTER TABLE patient.patientmedication ALTER COLUMN id DROP DEFAULT;
       patient          postgres    false    248    247    248            �           2604    25754    patientprocedure id    DEFAULT     |   ALTER TABLE ONLY patient.patientprocedure ALTER COLUMN id SET DEFAULT nextval('patient.patientprocedure_id_seq'::regclass);
 C   ALTER TABLE patient.patientprocedure ALTER COLUMN id DROP DEFAULT;
       patient          postgres    false    242    241    242            �           2604    17203    patients id    DEFAULT     l   ALTER TABLE ONLY patient.patients ALTER COLUMN id SET DEFAULT nextval('patient.patients_id_seq'::regclass);
 ;   ALTER TABLE patient.patients ALTER COLUMN id DROP DEFAULT;
       patient          postgres    false    232    231                       2604    25995    refreshtoken refreshtokenid    DEFAULT     �   ALTER TABLE ONLY token.refreshtoken ALTER COLUMN refreshtokenid SET DEFAULT nextval('token.refreshtoken_refreshtokenid_seq'::regclass);
 I   ALTER TABLE token.refreshtoken ALTER COLUMN refreshtokenid DROP DEFAULT;
       token          postgres    false    254    253    254            �           2604    17206    users id    DEFAULT     b   ALTER TABLE ONLY users.users ALTER COLUMN id SET DEFAULT nextval('users.users_id_seq'::regclass);
 6   ALTER TABLE users.users ALTER COLUMN id DROP DEFAULT;
       users          postgres    false    234    233            �           2604    17207    vistorsinfo id    DEFAULT     r   ALTER TABLE ONLY visitor.vistorsinfo ALTER COLUMN id SET DEFAULT nextval('visitor.vistorsinfo_id_seq'::regclass);
 >   ALTER TABLE visitor.vistorsinfo ALTER COLUMN id DROP DEFAULT;
       visitor          postgres    false    236    235                      0    26007    allergy 
   TABLE DATA           {   COPY allergy.allergy (id, allergyid, allergytype, allergyname, allergydescription, allergyclinicalinformation) FROM stdin;
    allergy          postgres    false    256   H                0    34067    appointmenthistory 
   TABLE DATA           �   COPY appointment.appointmenthistory (id, appointmentid, userid, appointmentdate, starttime, endtime, reason, createdon) FROM stdin;
    appointment          postgres    false    259   Ud      
          0    25952    appointments 
   TABLE DATA           �   COPY appointment.appointments (id, patientid, meetingtitle, description, physicianid, appointmentdate, starttime, endtime, status, appointmentrescheduledate, createdby, createdon, updatedby, updatedon) FROM stdin;
    appointment          postgres    false    252   rd      �          0    17103 	   diagnosis 
   TABLE DATA           H   COPY master.diagnosis (id, code, description, isdepricated) FROM stdin;
    master          postgres    false    217   �d                0    25805    drugdata 
   TABLE DATA           p   COPY master.drugdata (id, drugid, drugname, druggenericname, drugbrandname, drugstrength, drugform) FROM stdin;
    master          postgres    false    246   �e      �          0    17109    drugform 
   TABLE DATA           ,   COPY master.drugform (id, form) FROM stdin;
    master          postgres    false    219   �e      �          0    17113 	   procedure 
   TABLE DATA           H   COPY master.procedure (id, code, description, isdepricated) FROM stdin;
    master          postgres    false    221   af      �          0    17119 
   procedures 
   TABLE DATA           u   COPY master.procedures (id, code, description, isdepricated, createdby, createdon, updatedby, updatedon) FROM stdin;
    master          postgres    false    223   ag      �          0    17128    relationship 
   TABLE DATA           0   COPY master.relationship (id, name) FROM stdin;
    master          postgres    false    225   ~g      �          0    17132    roles 
   TABLE DATA           )   COPY master.roles (id, name) FROM stdin;
    master          postgres    false    227   �g      	          0    25921    status 
   TABLE DATA           *   COPY master.status (id, name) FROM stdin;
    master          postgres    false    251   h                0    25884    userrole 
   TABLE DATA           2   COPY master.userrole (userid, roleid) FROM stdin;
    master          postgres    false    249   Ih      �          0    17142    notes 
   TABLE DATA           �   COPY notes.notes (id, receiverid, senderid, message, urgencylevel, noteviewdate, createdby, createdon, updatedby, updateon) FROM stdin;
    notes          postgres    false    229   fh      �          0    25695    emergencycontactinfo 
   TABLE DATA           �   COPY patient.emergencycontactinfo (id, title, firstname, lastname, email, contactnumber, relationshipid, postalcode, city, state, country, accesspatientportal, address) FROM stdin;
    patient          postgres    false    238   �h      �          0    25709    patientallergy 
   TABLE DATA           �   COPY patient.patientallergy (id, patientid, allergyid, allergytype, allergydescription, allergyclinicalinformation, allergyfatal, createdby, createdon, updatedby, updatedon, allergyname, isactive) FROM stdin;
    patient          postgres    false    240   ki                0    25778    patientdiagnosis 
   TABLE DATA           �   COPY patient.patientdiagnosis (id, patientvisitid, diagnosiscode, diagnosisdescription, isdepricated, createdby, createdon, updatedby, updatedon) FROM stdin;
    patient          postgres    false    244   �i                0    25814    patientmedication 
   TABLE DATA           �   COPY patient.patientmedication (id, patientvisitid, drugid, drugname, druggenericname, drugbrandname, drugform, drugstrength, createdby, createdon, updatedby, updatedon) FROM stdin;
    patient          postgres    false    248   �i                 0    25751    patientprocedure 
   TABLE DATA           �   COPY patient.patientprocedure (id, patientvisitid, procedurecode, proceduredescription, isdepricated, createdby, createdon, updatedby, updatedon) FROM stdin;
    patient          postgres    false    242   �i      �          0    17152    patients 
   TABLE DATA           �   COPY patient.patients (id, patientid, race, ethnicity, languages, patientrelationshipid, allergyid, address, isportalaccessible, createdby, createdon, updatedby, updatedon, city, state, country, postalcode, emergencycontactid) FROM stdin;
    patient          postgres    false    231   �i                0    25992    refreshtoken 
   TABLE DATA           V   COPY token.refreshtoken (refreshtokenid, token, jwtid, userid, createdon) FROM stdin;
    token          postgres    false    254   �i      �          0    17175    users 
   TABLE DATA           �   COPY users.users (id, title, firstname, lastname, email, password, dateofbirth, gender, roleid, contactnumber, isactive, invalidloginattempts, createdby, createdon, updatedby, updatedon, dateofjoining, statusid) FROM stdin;
    users          postgres    false    233   �q      �          0    17183    vistorsinfo 
   TABLE DATA           �   COPY visitor.vistorsinfo (id, patientid, height, weight, bloodpressure, bodytemprature, respirationrate, createdby, createdon, updatedby, updatedon) FROM stdin;
    visitor          postgres    false    235   ~t      ,           0    0    allergy_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('allergy.allergy_id_seq', 1, false);
          allergy          postgres    false    255            -           0    0    appointmenthistory_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('appointment.appointmenthistory_id_seq', 1, false);
          appointment          postgres    false    258            .           0    0    appointments_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('appointment.appointments_id_seq', 1, false);
          appointment          postgres    false    257            /           0    0 "   diagnosiscodeanddescription_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('master.diagnosiscodeanddescription_id_seq', 12, true);
          master          postgres    false    218            0           0    0    drugdata_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('master.drugdata_id_seq', 1, false);
          master          postgres    false    245            1           0    0    drugform_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('master.drugform_id_seq', 10, true);
          master          postgres    false    220            2           0    0 "   procedurecodeanddescription_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('master.procedurecodeanddescription_id_seq', 10, true);
          master          postgres    false    222            3           0    0    procedures_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('master.procedures_id_seq', 1, false);
          master          postgres    false    224            4           0    0    relationship_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('master.relationship_id_seq', 1, false);
          master          postgres    false    226            5           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('master.roles_id_seq', 1, false);
          master          postgres    false    228            6           0    0    status_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('master.status_id_seq', 3, true);
          master          postgres    false    250            7           0    0    notes_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('notes.notes_id_seq', 9, true);
          notes          postgres    false    230            8           0    0    emergencycontactinfo_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('patient.emergencycontactinfo_id_seq', 1, false);
          patient          postgres    false    237            9           0    0    patientallergy_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('patient.patientallergy_id_seq', 1, false);
          patient          postgres    false    239            :           0    0    patientdiagnosis_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('patient.patientdiagnosis_id_seq', 1, false);
          patient          postgres    false    243            ;           0    0    patientmedication_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('patient.patientmedication_id_seq', 1, false);
          patient          postgres    false    247            <           0    0    patientprocedure_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('patient.patientprocedure_id_seq', 1, false);
          patient          postgres    false    241            =           0    0    patients_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('patient.patients_id_seq', 8, true);
          patient          postgres    false    232            >           0    0    refreshtoken_refreshtokenid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('token.refreshtoken_refreshtokenid_seq', 157, true);
          token          postgres    false    253            ?           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('users.users_id_seq', 34, true);
          users          postgres    false    234            @           0    0    vistorsinfo_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('visitor.vistorsinfo_id_seq', 1, true);
          visitor          postgres    false    236            0           2606    26014    allergy allergy_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY allergy.allergy
    ADD CONSTRAINT allergy_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY allergy.allergy DROP CONSTRAINT allergy_pkey;
       allergy            postgres    false    256            2           2606    34075 *   appointmenthistory appointmenthistory_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY appointment.appointmenthistory
    ADD CONSTRAINT appointmenthistory_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY appointment.appointmenthistory DROP CONSTRAINT appointmenthistory_pkey;
       appointment            postgres    false    259            ,           2606    25960    appointments appointments_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY appointment.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY appointment.appointments DROP CONSTRAINT appointments_pkey;
       appointment            postgres    false    252            
           2606    17217 *   diagnosis diagnosiscodeanddescription_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY master.diagnosis
    ADD CONSTRAINT diagnosiscodeanddescription_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY master.diagnosis DROP CONSTRAINT diagnosiscodeanddescription_pkey;
       master            postgres    false    217            &           2606    25812    drugdata drugdata_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY master.drugdata
    ADD CONSTRAINT drugdata_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY master.drugdata DROP CONSTRAINT drugdata_pkey;
       master            postgres    false    246                       2606    17219    drugform drugform_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY master.drugform
    ADD CONSTRAINT drugform_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY master.drugform DROP CONSTRAINT drugform_pkey;
       master            postgres    false    219                       2606    17221 *   procedure procedurecodeanddescription_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY master.procedure
    ADD CONSTRAINT procedurecodeanddescription_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY master.procedure DROP CONSTRAINT procedurecodeanddescription_pkey;
       master            postgres    false    221                       2606    17223    procedures procedures_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY master.procedures
    ADD CONSTRAINT procedures_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY master.procedures DROP CONSTRAINT procedures_pkey;
       master            postgres    false    223                       2606    17225    relationship relationship_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY master.relationship
    ADD CONSTRAINT relationship_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY master.relationship DROP CONSTRAINT relationship_pkey;
       master            postgres    false    225                       2606    17227    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY master.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY master.roles DROP CONSTRAINT roles_pkey;
       master            postgres    false    227            *           2606    25926    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY master.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY master.status DROP CONSTRAINT status_pkey;
       master            postgres    false    251                       2606    17231    notes notes_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY notes.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY notes.notes DROP CONSTRAINT notes_pkey;
       notes            postgres    false    229                       2606    25702 .   emergencycontactinfo emergencycontactinfo_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY patient.emergencycontactinfo
    ADD CONSTRAINT emergencycontactinfo_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY patient.emergencycontactinfo DROP CONSTRAINT emergencycontactinfo_pkey;
       patient            postgres    false    238                        2606    25719 "   patientallergy patientallergy_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY patient.patientallergy
    ADD CONSTRAINT patientallergy_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY patient.patientallergy DROP CONSTRAINT patientallergy_pkey;
       patient            postgres    false    240            $           2606    25788 &   patientdiagnosis patientdiagnosis_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY patient.patientdiagnosis
    ADD CONSTRAINT patientdiagnosis_pkey PRIMARY KEY (id);
 Q   ALTER TABLE ONLY patient.patientdiagnosis DROP CONSTRAINT patientdiagnosis_pkey;
       patient            postgres    false    244            (           2606    25823 (   patientmedication patientmedication_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY patient.patientmedication
    ADD CONSTRAINT patientmedication_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY patient.patientmedication DROP CONSTRAINT patientmedication_pkey;
       patient            postgres    false    248            "           2606    25761 &   patientprocedure patientprocedure_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY patient.patientprocedure
    ADD CONSTRAINT patientprocedure_pkey PRIMARY KEY (id);
 Q   ALTER TABLE ONLY patient.patientprocedure DROP CONSTRAINT patientprocedure_pkey;
       patient            postgres    false    242                       2606    17233    patients patients_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY patient.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY patient.patients DROP CONSTRAINT patients_pkey;
       patient            postgres    false    231            .           2606    26000    refreshtoken refreshtoken_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY token.refreshtoken
    ADD CONSTRAINT refreshtoken_pkey PRIMARY KEY (refreshtokenid);
 G   ALTER TABLE ONLY token.refreshtoken DROP CONSTRAINT refreshtoken_pkey;
       token            postgres    false    254                       2606    17241    users users_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY users.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY users.users DROP CONSTRAINT users_pkey;
       users            postgres    false    233                       2606    17243    vistorsinfo vistorsinfo_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY visitor.vistorsinfo
    ADD CONSTRAINT vistorsinfo_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY visitor.vistorsinfo DROP CONSTRAINT vistorsinfo_pkey;
       visitor            postgres    false    235            Z           2606    34076 8   appointmenthistory appointmenthistory_appointmentid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY appointment.appointmenthistory
    ADD CONSTRAINT appointmenthistory_appointmentid_fkey FOREIGN KEY (appointmentid) REFERENCES appointment.appointments(id) ON DELETE CASCADE;
 g   ALTER TABLE ONLY appointment.appointmenthistory DROP CONSTRAINT appointmenthistory_appointmentid_fkey;
       appointment          postgres    false    259    252    3372            [           2606    34081 1   appointmenthistory appointmenthistory_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY appointment.appointmenthistory
    ADD CONSTRAINT appointmenthistory_userid_fkey FOREIGN KEY (userid) REFERENCES users.users(id);
 `   ALTER TABLE ONLY appointment.appointmenthistory DROP CONSTRAINT appointmenthistory_userid_fkey;
       appointment          postgres    false    3354    233    259            U           2606    25961 (   appointments appointments_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY appointment.appointments
    ADD CONSTRAINT appointments_createdby_fkey FOREIGN KEY (createdby) REFERENCES users.users(id);
 W   ALTER TABLE ONLY appointment.appointments DROP CONSTRAINT appointments_createdby_fkey;
       appointment          postgres    false    3354    252    233            V           2606    25966 (   appointments appointments_patientid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY appointment.appointments
    ADD CONSTRAINT appointments_patientid_fkey FOREIGN KEY (patientid) REFERENCES users.users(id);
 W   ALTER TABLE ONLY appointment.appointments DROP CONSTRAINT appointments_patientid_fkey;
       appointment          postgres    false    233    252    3354            W           2606    25971 *   appointments appointments_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY appointment.appointments
    ADD CONSTRAINT appointments_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES users.users(id);
 Y   ALTER TABLE ONLY appointment.appointments DROP CONSTRAINT appointments_physicianid_fkey;
       appointment          postgres    false    252    3354    233            X           2606    25976 (   appointments appointments_updatedby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY appointment.appointments
    ADD CONSTRAINT appointments_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users.users(id);
 W   ALTER TABLE ONLY appointment.appointments DROP CONSTRAINT appointments_updatedby_fkey;
       appointment          postgres    false    3354    252    233            O           2606    25942    drugdata drugdata_drugform_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY master.drugdata
    ADD CONSTRAINT drugdata_drugform_fkey FOREIGN KEY (drugform) REFERENCES master.drugform(id);
 I   ALTER TABLE ONLY master.drugdata DROP CONSTRAINT drugdata_drugform_fkey;
       master          postgres    false    219    246    3340            3           2606    17299 $   procedures procedures_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY master.procedures
    ADD CONSTRAINT procedures_createdby_fkey FOREIGN KEY (createdby) REFERENCES users.users(id);
 N   ALTER TABLE ONLY master.procedures DROP CONSTRAINT procedures_createdby_fkey;
       master          postgres    false    223    3354    233            4           2606    17304 $   procedures procedures_updatedby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY master.procedures
    ADD CONSTRAINT procedures_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users.users(id);
 N   ALTER TABLE ONLY master.procedures DROP CONSTRAINT procedures_updatedby_fkey;
       master          postgres    false    223    3354    233            S           2606    25887    userrole userrole_roleid_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY master.userrole
    ADD CONSTRAINT userrole_roleid_fkey FOREIGN KEY (roleid) REFERENCES master.roles(id);
 G   ALTER TABLE ONLY master.userrole DROP CONSTRAINT userrole_roleid_fkey;
       master          postgres    false    3348    249    227            T           2606    25892    userrole userrole_userid_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY master.userrole
    ADD CONSTRAINT userrole_userid_fkey FOREIGN KEY (userid) REFERENCES users.users(id);
 G   ALTER TABLE ONLY master.userrole DROP CONSTRAINT userrole_userid_fkey;
       master          postgres    false    3354    233    249            5           2606    17324    notes notes_createdby_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY notes.notes
    ADD CONSTRAINT notes_createdby_fkey FOREIGN KEY (createdby) REFERENCES users.users(id);
 C   ALTER TABLE ONLY notes.notes DROP CONSTRAINT notes_createdby_fkey;
       notes          postgres    false    229    3354    233            6           2606    17329    notes notes_receiverid_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY notes.notes
    ADD CONSTRAINT notes_receiverid_fkey FOREIGN KEY (receiverid) REFERENCES users.users(id);
 D   ALTER TABLE ONLY notes.notes DROP CONSTRAINT notes_receiverid_fkey;
       notes          postgres    false    229    233    3354            7           2606    17334    notes notes_senderid_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY notes.notes
    ADD CONSTRAINT notes_senderid_fkey FOREIGN KEY (senderid) REFERENCES users.users(id);
 B   ALTER TABLE ONLY notes.notes DROP CONSTRAINT notes_senderid_fkey;
       notes          postgres    false    3354    229    233            8           2606    17339    notes notes_updatedby_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY notes.notes
    ADD CONSTRAINT notes_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users.users(id);
 C   ALTER TABLE ONLY notes.notes DROP CONSTRAINT notes_updatedby_fkey;
       notes          postgres    false    233    3354    229            E           2606    25703 =   emergencycontactinfo emergencycontactinfo_relationshipid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.emergencycontactinfo
    ADD CONSTRAINT emergencycontactinfo_relationshipid_fkey FOREIGN KEY (relationshipid) REFERENCES master.relationship(id);
 h   ALTER TABLE ONLY patient.emergencycontactinfo DROP CONSTRAINT emergencycontactinfo_relationshipid_fkey;
       patient          postgres    false    3346    225    238            G           2606    25725 ,   patientallergy patientallergy_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.patientallergy
    ADD CONSTRAINT patientallergy_createdby_fkey FOREIGN KEY (createdby) REFERENCES users.users(id);
 W   ALTER TABLE ONLY patient.patientallergy DROP CONSTRAINT patientallergy_createdby_fkey;
       patient          postgres    false    233    3354    240            F           2606    25720 ,   patientallergy patientallergy_patientid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.patientallergy
    ADD CONSTRAINT patientallergy_patientid_fkey FOREIGN KEY (patientid) REFERENCES patient.patients(id);
 W   ALTER TABLE ONLY patient.patientallergy DROP CONSTRAINT patientallergy_patientid_fkey;
       patient          postgres    false    3352    231    240            H           2606    25730 ,   patientallergy patientallergy_updatedby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.patientallergy
    ADD CONSTRAINT patientallergy_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users.users(id);
 W   ALTER TABLE ONLY patient.patientallergy DROP CONSTRAINT patientallergy_updatedby_fkey;
       patient          postgres    false    3354    240    233            M           2606    25794 0   patientdiagnosis patientdiagnosis_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.patientdiagnosis
    ADD CONSTRAINT patientdiagnosis_createdby_fkey FOREIGN KEY (createdby) REFERENCES users.users(id);
 [   ALTER TABLE ONLY patient.patientdiagnosis DROP CONSTRAINT patientdiagnosis_createdby_fkey;
       patient          postgres    false    3354    244    233            L           2606    25789 5   patientdiagnosis patientdiagnosis_patientvisitid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.patientdiagnosis
    ADD CONSTRAINT patientdiagnosis_patientvisitid_fkey FOREIGN KEY (patientvisitid) REFERENCES visitor.vistorsinfo(id);
 `   ALTER TABLE ONLY patient.patientdiagnosis DROP CONSTRAINT patientdiagnosis_patientvisitid_fkey;
       patient          postgres    false    244    235    3356            N           2606    25799 0   patientdiagnosis patientdiagnosis_updatedby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.patientdiagnosis
    ADD CONSTRAINT patientdiagnosis_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users.users(id);
 [   ALTER TABLE ONLY patient.patientdiagnosis DROP CONSTRAINT patientdiagnosis_updatedby_fkey;
       patient          postgres    false    3354    244    233            Q           2606    25829 2   patientmedication patientmedication_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.patientmedication
    ADD CONSTRAINT patientmedication_createdby_fkey FOREIGN KEY (createdby) REFERENCES users.users(id);
 ]   ALTER TABLE ONLY patient.patientmedication DROP CONSTRAINT patientmedication_createdby_fkey;
       patient          postgres    false    3354    248    233            P           2606    25824 7   patientmedication patientmedication_patientvisitid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.patientmedication
    ADD CONSTRAINT patientmedication_patientvisitid_fkey FOREIGN KEY (patientvisitid) REFERENCES visitor.vistorsinfo(id);
 b   ALTER TABLE ONLY patient.patientmedication DROP CONSTRAINT patientmedication_patientvisitid_fkey;
       patient          postgres    false    248    3356    235            R           2606    25834 2   patientmedication patientmedication_updatedby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.patientmedication
    ADD CONSTRAINT patientmedication_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users.users(id);
 ]   ALTER TABLE ONLY patient.patientmedication DROP CONSTRAINT patientmedication_updatedby_fkey;
       patient          postgres    false    248    233    3354            J           2606    25767 0   patientprocedure patientprocedure_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.patientprocedure
    ADD CONSTRAINT patientprocedure_createdby_fkey FOREIGN KEY (createdby) REFERENCES users.users(id);
 [   ALTER TABLE ONLY patient.patientprocedure DROP CONSTRAINT patientprocedure_createdby_fkey;
       patient          postgres    false    242    3354    233            I           2606    25762 5   patientprocedure patientprocedure_patientvisitid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.patientprocedure
    ADD CONSTRAINT patientprocedure_patientvisitid_fkey FOREIGN KEY (patientvisitid) REFERENCES visitor.vistorsinfo(id);
 `   ALTER TABLE ONLY patient.patientprocedure DROP CONSTRAINT patientprocedure_patientvisitid_fkey;
       patient          postgres    false    235    3356    242            K           2606    25772 0   patientprocedure patientprocedure_updatedby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.patientprocedure
    ADD CONSTRAINT patientprocedure_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users.users(id);
 [   ALTER TABLE ONLY patient.patientprocedure DROP CONSTRAINT patientprocedure_updatedby_fkey;
       patient          postgres    false    3354    233    242            9           2606    17349     patients patients_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.patients
    ADD CONSTRAINT patients_createdby_fkey FOREIGN KEY (createdby) REFERENCES users.users(id);
 K   ALTER TABLE ONLY patient.patients DROP CONSTRAINT patients_createdby_fkey;
       patient          postgres    false    233    231    3354            =           2606    25839 )   patients patients_emergencycontactid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.patients
    ADD CONSTRAINT patients_emergencycontactid_fkey FOREIGN KEY (emergencycontactid) REFERENCES patient.emergencycontactinfo(id);
 T   ALTER TABLE ONLY patient.patients DROP CONSTRAINT patients_emergencycontactid_fkey;
       patient          postgres    false    238    3358    231            :           2606    17354     patients patients_patientid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.patients
    ADD CONSTRAINT patients_patientid_fkey FOREIGN KEY (patientid) REFERENCES users.users(id);
 K   ALTER TABLE ONLY patient.patients DROP CONSTRAINT patients_patientid_fkey;
       patient          postgres    false    3354    233    231            ;           2606    17359 ,   patients patients_patientrelationshipid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.patients
    ADD CONSTRAINT patients_patientrelationshipid_fkey FOREIGN KEY (patientrelationshipid) REFERENCES master.relationship(id);
 W   ALTER TABLE ONLY patient.patients DROP CONSTRAINT patients_patientrelationshipid_fkey;
       patient          postgres    false    225    3346    231            <           2606    17364     patients patients_updatedby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patient.patients
    ADD CONSTRAINT patients_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users.users(id);
 K   ALTER TABLE ONLY patient.patients DROP CONSTRAINT patients_updatedby_fkey;
       patient          postgres    false    233    231    3354            Y           2606    26001 %   refreshtoken refreshtoken_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY token.refreshtoken
    ADD CONSTRAINT refreshtoken_userid_fkey FOREIGN KEY (userid) REFERENCES users.users(id);
 N   ALTER TABLE ONLY token.refreshtoken DROP CONSTRAINT refreshtoken_userid_fkey;
       token          postgres    false    3354    254    233            >           2606    17389    users users_createdby_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY users.users
    ADD CONSTRAINT users_createdby_fkey FOREIGN KEY (createdby) REFERENCES users.users(id);
 C   ALTER TABLE ONLY users.users DROP CONSTRAINT users_createdby_fkey;
       users          postgres    false    3354    233    233            ?           2606    17394    users users_roleid_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY users.users
    ADD CONSTRAINT users_roleid_fkey FOREIGN KEY (roleid) REFERENCES master.roles(id);
 @   ALTER TABLE ONLY users.users DROP CONSTRAINT users_roleid_fkey;
       users          postgres    false    3348    227    233            A           2606    25935    users users_statusid_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY users.users
    ADD CONSTRAINT users_statusid_fkey FOREIGN KEY (statusid) REFERENCES master.status(id);
 B   ALTER TABLE ONLY users.users DROP CONSTRAINT users_statusid_fkey;
       users          postgres    false    233    3370    251            @           2606    17399    users users_updatedby_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY users.users
    ADD CONSTRAINT users_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users.users(id);
 C   ALTER TABLE ONLY users.users DROP CONSTRAINT users_updatedby_fkey;
       users          postgres    false    233    233    3354            B           2606    17404 &   vistorsinfo vistorsinfo_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY visitor.vistorsinfo
    ADD CONSTRAINT vistorsinfo_createdby_fkey FOREIGN KEY (createdby) REFERENCES users.users(id);
 Q   ALTER TABLE ONLY visitor.vistorsinfo DROP CONSTRAINT vistorsinfo_createdby_fkey;
       visitor          postgres    false    235    3354    233            C           2606    17419 &   vistorsinfo vistorsinfo_patientid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY visitor.vistorsinfo
    ADD CONSTRAINT vistorsinfo_patientid_fkey FOREIGN KEY (patientid) REFERENCES users.users(id);
 Q   ALTER TABLE ONLY visitor.vistorsinfo DROP CONSTRAINT vistorsinfo_patientid_fkey;
       visitor          postgres    false    235    3354    233            D           2606    17429 &   vistorsinfo vistorsinfo_updatedby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY visitor.vistorsinfo
    ADD CONSTRAINT vistorsinfo_updatedby_fkey FOREIGN KEY (updatedby) REFERENCES users.users(id);
 Q   ALTER TABLE ONLY visitor.vistorsinfo DROP CONSTRAINT vistorsinfo_updatedby_fkey;
       visitor          postgres    false    233    235    3354                  x�Žm�۶���Y���U�&u��D |�8�;k���w����[� �#1�H-�[���� %��E�[�xD�� @��.^��q�O+w�.��t/3{J�Dݪ�<V�~rɴ,×|�F�Σ�vd�[O+�Q��,�eZ� ���!=���|)4��f��g��%�F��Ks�!)�{Gf���!�KDj��NrH�]�2��/o�2�(o�[�+-鏓��u]��2ڀ�����ep��9���>��4v�G�K�R�>��(�$ˎ����K�� 6$4��l�@l�z�W�q �dm�����}t�^n�/�*�;�ʉ�Z*]�Ǘn�%�8Ix�Жdc$#-���ɗl�%�8I��|�{K�.~I2�����F��"� ��O:ov2�!�� +a�d�f��AHh!>Xr��Bb��X2_���%�P8X(t2	UV�毲�K�d��cR9����l���N�:)�".�8����^
t4lɢ�G�����#���s��#*^�G�|eK��R�F�>�]�^��~�u"��X�j�R��i�O�u��-��1O)-v��,9k��o��)nK.�d��܆0��K^�O�V��K�-����C���x�����lr���+�o�/��< �����PIGc�O�[���"�`\�#\%�nV�#�X���E��.|�{h��s�C��� 1B��2c#�Ui�'VC�F����\����n�_��6U�³p')s�3	/�~��ԒK�6�d��Ą����k@l�;1�S�.�2�y}��C�����X�����	�����oL,=�aӓĝ��K�Ӡ)�ҒN�K�2�߰�k�7�9e�	��[��������BT��3jL��c&�
�����y���^�y
m��Iv�MYl���҇�Q���W��ܦX�;�P�lUub�j�����R�rVK���
c(R��b��ʌ���¥/4�_	䱥�d�7�Y t����E�

�~d@s���Qk�E��h��,����6�X�e`t{0F�/֡1�20}������9�,��s�t�h���1�\\i�-��<�%�N�3�c�4	�Ƈ��P#��<݂��O�,C��!M�AH���{'#�y�3-������}J�*���(��]����,�[��[��$]�'��)�CQ�`���E�n��MY��^Ҫ���y+��M�d�\��"�.7��N-�*����n�Z���^� �0�ei��b
�_B�~^�8� �%tk��Jd
2\FL#/}�)��y���M��ˈ/�K'�hZ�)�]��u>;�ʂǟ��2U�4�ӂ[r	�_�u����(5�;=����h-����χ�D�@�N\�1�'�kЅ���2
��V���I���4!Zh�Z��7xQ�-�H�.fB�4�PY����D��Kw�Ґh���a�q����a��,�Jc�HQ~]&O������k�2�%v����RA�e��� BY q�h�쮄]�� �vO�.���6f�V��
�R�04A+ �4#�9fu�h��iW�*�^?w��.��CiЭs]נ؋y�|����_j9Gи4����%0.�U]T=V�8��W�:�.i�r�d���2�[|���C�w6E4\�#��m�������5꒲�@�����r�W�<V��(�x/��8�N`B6��̿��Uػ�! �;���0�w�uQ��A貖X�w�QV�q7�����:p(�ejHc�����8�YOb�����8h�mG�p���8�o���\�M�����u7��������gg��4�G����3}BȔ^Е����(�={v��ejX>XM��|QS9����)m&��A�ɕ>}}<�r���3���\�t7������+%�J�"��|S���*h��$��A_O_$5�F9��p���s��J=��_lti�1��0^Q)m8Di��S��|��V���=J��!
�- �R��e�<(r>X�
]M��r`WLfq��W� �����Ǹ.��D�N�+�/N���`�H�+�p|�klh���9�ñ�u��8*/2�	�������8K�3]S�x��c����x H��o���ƙL��F�
���+��2��&�"��U�'e�#l�5��vJ�9 ���p{:�P'{��T�"���K;�{�gQ�*gPV -{����ފ��ulu��y��[H�ui}u��Ti��z8U�����dեj>�I/آВ���`?^�&\������z��<�2h�@���6��z���������6�{�Pc��Dm���k^%q�x��`X�q)0��V�U�@�0�Xbu���|TR��-���=��vޟ�*�J�n��th�}�q|>>��5N��A{������v�=����@�~���8�Z�Δ�`�˂��R��I��r�y����������N�Li�ǴN����,��U&Ĉ�����hq���4E,`��fA}���~��h�4��(�����@j~��7�"ifw��7�o�E^�����I^ẽ6�H�S����f�R��}���Q�J�ߒ�<R�IlV��҂^��HP_AG�!�x; A�!�y$�%�y$֒�y$ޒ�y$ђ�y$�&�9$�%�����h��x�BG�F44:�"A%��C����ٞ��1�vx;��ҩd��)T�M�g�2����ů���Czp�=Һ(�di��͢��j�uQ��)�A/3ͤ}G�_J��'y]��\v;.�̗��Vͽ�'%4v����L�	���m�	� �
�n�l(�Է��FР����ih���}�N��kE�(2q�@�P��d��#����4w~��_tb��Toi�l��+0���n�� ��R�o�]W���F���[m��6�E��z��TM5�w�=|ph�'e��)~����_2wukh PSʂ[B���j!Ԕ��V)� 
%zEi���5ߤ��'2�NP�Ç *�:)�<V]E�	�]��tO��l:�l8��[����bY�)T�Qd�vޕ�񠺐4��j���i=d'ޝ�8�����BW��B#<�}5�o%Q��B�{�N<��jh��J1���fv�h���М��bz^z��3�m�	�$��irڲƆ�O`�LѸ�g� �4��+{F�0�uf~����;sv�f�Cw �7��
��֋א���~)�
�(6<%���y`D��f�9��_��h����܌f�9�nc��<8g�m��,�M�F�ᜅ�i�h^��F��ŗӺ,�^>�T�X��� �Ls*I�����z`R7���K���g#�q���5]���+�6����C҅�5�u�4��i>V���B���G���F�Bs!|-�����-��cGY���_gs�jg��o�����Nn���QU�n � v�f��8b�Dh�þ_<�O����Vv<���ǵ�����L<�[*�
g�5"�&��j��F�o"L$�f���S��Y�2��M>��o"�n�|����הy��Q@��kJyx��ab�K��虂�n�-X�)�=�Wv7���1�v�{������c�G!�1xv7j4�1�v7j.�1V�w��Ў�|�L߮B��〛1X��"a�+��dߦ��V���$_!��x߮EB�Z���F8��N�}�>J6�����F)�v��M�M�d`@�-��Ҍ�4G�L3tQS�og�#>S��L
L)�,�JUh�.����0 ���oi4rȍ�Q~�"ڭ	8X��)���e�C�	M��Iǔ��y;;����.�A����P'e���*�q!��x�GG��
�~\?z��e'��˅�ZH%�0.�A�t)�Ȏ�&v��ꂎ�Z�;�����k��������FU�â���#n�����YG�D5��T��g���a�n/;�MT���Q���QЉhh��QS+��r^��xd*�Q�A����ʊg�؄x\;����xL�0��3H#���2uø^ȰwB/��B`��W�q8t��S�zOZ��b\�gX^���5n����W�Ҹ}=(�nj�[W}@zd�oX�)�k*��l�q����M5���`-��mv:�    `(�S���  װ�*�A0����`W>�`��x��Z_�
�P��&D���	3��q%mk�����ӂ����Y;!-�S�{YJ�<��	��L|$���4�;)(H�'T��7]S��,\��ir�.�1<лa0���߆�޳W�y�[�BB2�&�[YK���G�M�I�&z7�G�Әgg���M� ��䭡�e���鬋���c�f����e����ƭ��P�f���7�\2��_i�	��a��a��g�=���a��/-h�V��� �n�T�{��ߖ�[/����YõS}3�6Dk�M�L���FN���)�7�0��֪�<��޹G��\��?
�t&��&˸Ƶ� ������بY�=Q�7�E�7�Z�ˍ#��̑��2n�O�d����^锒b��m�'O�1�61t��8���}���wF�8���]�7�w����"�	��$����&l{D���܁|v��E�0p_�L���R�i�_�f*��ܽ|#�}�7�+� �w򫁛�gF 5�c��l!?��yb�V�����csj��{T���p( >��ñh��T���<��}*��m'2:3�b�֯�W�C���H�C���U�
u8�P�~����C�Б9��x8��n򩠇����ק>-�U�.��4�RᏮ|֡�c����񢀎���1}��st��(�F"�YaJ�C,ש�S�Y�|F<(
�S�>�:B��ww(� E���C%��OH֧N1�#�pL7����'��PX�xcˋ�)���4x��O�A潪_���dEZ���t��	+n7v���!a��(�AD��nd�]hF��p#c�c��.�oZ�_zF�ܴ��6�<��M+�Nm
��U?$�v�v���B� $�o�3��nAH�.��ck�O��[�pd��et�A��mv�iG]��A4Ңb�(��x��^:e7�7�~��)�r�0?@�L�^z̒o�k�b��� w5�̓k�j�U�1��n���a���|M�>P�ȲN�i���Ш�6\��[�O6�ͥy-��O�o��\Z`��\ZhӼ�������&V+�6�br�7?m̦�N[SV��
xMi�ST����5Ń��;?$؆E�c?�����ٹ �f
�w�Tz�'��؞��)>���@3�'�M�{J�2�l�,]�`M��f�6�i��4*P���W�G���C�fE��b8����+Z2�-�JU�M��=��e���.�&�;`�!ʲ=g�X�i���!K�f.+<Ӣ��էK-�.����9��2��eU��ē}�����@��Iˡ�G�@�Ԯ�����Sl
:F��AK�}���x�~��g���1۪�� -�D���Md�%z���|"j/�6��l���-�OM��11?��e^˘���5���==�YP�X�Y��w�CײN��ބ��3�m΋�����NK�В�x��!�7��\ji E6�� �M�sH�MsH�&�sH�&sH�&�sH�M��|���Ŧ��4G3����,}�uܝ�O��qכC�uܝ����qw�f
[��9�)lw�h��t�ͪ�o���t"�Is4S�6i�>E6i�>y+�4G�<K���o�g��;��<��|	,�踘E[�3:��j���f�) ���p)TC����Jb�Gy��'c���η�W�m�X��r���
�Dq���D�AI檽�A·����*s�$��;�$Z��W�H�'���r�VN��F��F�Z
7����e�N��p�Y�{�I&@K��	l
��>��m��B6��B�l�?��ۄ`
!�	�Bh�)��"4��B`�;E'['�):�:�N����I6�d�N�i�&L��ɪu3߫)�]R���Ƈj�'��m����fݟ��(7r+��;$e�5Ϳd	>�k�Q�*Qi���S��5b�����!��$�J��C��*���������X�^�� 2�Hv$���P���`
�5�puHEҟ@�Oiln�š�'R���N��6���5�O�����+�����_I�T�(Ox��|Bw�xn���@�lҙ);��ۤ�N�RВ.��cHaK�`��!E�t� Jb�(v���fN��]&(zY�+���Xx�r��ި?T��ZL3�h�I����G������Z͓ld�O�]�J�O��4b�	��	�f�<�g�|��R'��a�AA8���]��U����/*���pM������w��I6`З%6H�t�rR>�e�W��#��nK�V+��oMwm��5��t��t���F_�>d�E���$�g\YO^ϋo�6��6��>��1���[���^��򍦼U�)��:Oo������o6Ė���~�9 P�� 1$��F���j��N�x�O�2��'h�N�k-��5x���I�0d����T_!�'Y�e�e�����Y�9Q˹`5氕�ݾ�Y�	�C�Z��g)���~D���$�I��1+�&%�Lu�D���X�!Z(LS�a ���c:m��u��G�=%�V��6
�Px����R@6�M!x��MJ��%�i�`��
��]q��ؕ5�Bt���#\���펏�1�qj��x"�j?E�KR�Z���I�H�Il:	u��4���@�]�)�5�~�(���	�z�k��7��)ٜ��@<{m���ùMbsHb��WPt2�:�l:ί���N�K�(���$��@oA��t���<�!��3��LA�������xb�h) 6�M!��PN�4$`��O�<%T��)�oԝ�\jY�D6�M戕���9���z1$1Mb3@P^�>��U�38Pd��9�Ԯ·9�<r��˳��ixTR�G�飺Jq˼j�d'DS�.~ϒ�9�{��a��-<�2�t�@8���8aoe�®-,F
3[�)�ma������^��V+����OMʯ~h���
�����]�F��t��=���a	��^�7�8"	Z ��.zc��D�F���`��F���]�
� lt1+�0h"�S=��\�53t�1й�v�+='0Q�=��;�z+�Xͺ�E�:L3E�%y{\���>���ZyYֻ$�Zxw�%��"o�G�!�H�Գ�����&������;�� -��M`S�M�SLؤ��Rp�0�-� 4�OJo�{�g�F'���[���@�Ĥ& �.�W6��+;=J�>6�l�佱7�f;�p� 3P������&@�T(T	ߠG�[U�t]����AW��a�~���俏4�҄hQ���M�@=�ߝ��zZ���'|"A묔u�W��ւ �6�M����xsiW�0����`&�b��Oń�'���a�1ӳf�E��x�Ƚy�K���@!�Д|��)��j����EFw�Ԕ@=��&C��zSSE1�l��C�oC�DH`C���І�!�	&A��ʆ�!��&BX��l�6d���+aC��K�lȴO�|2����@ ����1LHI������A#~\���mWlΖ(�k���e{4��C�g`����~��NCT�U����qr� �?��	�o��!F�R4��<�y�<<�y|��hhѢٍѪ��Ϫ�&˲��
��O�Fŀ��tSn�����m�� ҷ��&��F� U����xX��dF���	G����(����L(��SȾ��O�8�_N�:;�!H�Ȕ��0\��&2��b��ʢ���'տ���U�,�?�`�d�;gA�M $�H6��!�����.�`p�Se2[��B?���U�x�<�"��b�|�x �����ϻ��3t��U���Ў�B?�a+ˆ��B���	���J,��iS��vԲ���|e��mٮf��	���Ȓϙf��,ю������Dh�?8%x�B��F3�y(��_<$�;�3���`��p�[�Ȭ���i���l���.��Ţ���m��'eS�-
��Ű��`���@c)Vhr��j�� B��f)�`-x|��R�����4�1�H󭵻��į -li6Vڳ��Xi_K��)�/,>�)��]w�D�x����    ����6�!�6���B4�-}oe�$��	|5!|f��c��B`�g�����������)<u^�ˣ�WCl��|��Ӻ(�����λ�����Δo�#ǩ�D�y'����0*.�}Z�i@]�q��(����(�|��b�w:�M1�>k% eʃW/�QPAhϷ��ܬ%����6is?�l<ښ>�4'S�vS��`�(l5c���-s������-kg�f;���-o\��r}�'Z����~H�;A�Wu+�a���)T����CZ���{���?��(9�g����l4���J�������}� ��g���d}:@����(����\u���y����<�*�Bnj�O�`�����X�-ݹڏ��+ȵ�����2O�P	�z&C�˛�yIƩ�kH�ey�J�&lR��Ū����/i��e�9�8����Z��ϴj��:�ܧ���y��m�>�Ju����T�����:�Q�}�x��37Cw��q�sn��ϰ�Pq�����C��\U:!)�8ϣq{����S�����*3����r<�5$��ݏH����j�q��?�_��%%Sw��a��|��#�!&b�<�%Ψ\���?a��l��6��o5�HD�s'cpS�QA�&m!
@�
�7r��;�*�_5�򗻷����d���5���~:s33d�K�"��玘^�Y����2����k��ެ�V����5���y�d{Aa�"W�M9��#Xq�ce=�$k���,��m����:us}�N���S�鄡�D(eh�����G�p=��{�����>Cy� �T��� ���]���y��~{��+L#��MA��ʾ��H���tT$W�ť�����n�*��wD� ����"p��Fm�oN�� ���vh��{[I�t��;�w�.i�g�qQ�t��|.���,�N8���T_[5}6����D=(���\��x�&k���4.j�ީ%� �yJ�Le�O�C��
d���������V�nHb�ֵ{N�wG�R�o��v�؊�Ƭl�Z��$6fM{bJ�x�:��8`thH�C�L����N|�0�|��ԏ5}ҦYы���Zr�2ɀ���m}9d�$����3G#�l��#F
��$ ~WRE>i����)�\�FN�ȧ�� NZɧ-�	8i'���q�U>n�U߾&�J��r�[�}8ijc���G	�#=���n��:e���0��Q�x���q:���2aБ�x�����<&U|��v	��jE�,��*��)�	:�Ҕk�<�Y�xZð�OPa:��d&߁M'������KR���z�����_='���dh������������Ѣ�1��Ot��h̥�34��o75�9��1�n8�}ӕ
��f�C���cy%�6���M�|�_���R?�7Et�'���&�E*(�)4��iJ�y��k��Box�l�Nt�`Z�E�:��ZpxE�Y�4��v+��:�l��ߑ�d����OzI6Բ��LK,�M�s-��.G���#,�v�2t~N8�Y��v8��ՠ8؊�i�~��u>81|�4��(���:(�Z�L�7R�4�׬���%��3�Y�=ޙK@sg^�lr����˼fq,4��+p�V��f¼��5=��/��Go�h����I4��Q}���݀�<1�K�b��bL'LU���m�:�4���܇�� F֌m��6�K����"}�a3�5��3�&v��y��Ԯ�>�Л��%�G6�G�V4���P�U�*��<5��#�p�+CpտFۧ��M�4��4�ͺh<�Օ`���RR��e�����g����92<��!U_��pj��E\�j���E/�`���0;?���EW���d;���o�ͣ��?�þ,��np3�燇Ϩ�[��b2��г���5�.�q�9@�XC7�O�?�s��j6��ckC�x:�9wY\�y�$�Ӧ,�NW���.�>�˩�t��=n20V<��'O��Y
���q�NJ���)����Pd��S�����MPХ���v��ˆ���Z,���X�Zu`|�5��Y��u`�^Ӕ��#�&63�`���L�g`b&L8��I��<�o��L�0S8f�f�)3s3����&��k
��̂�rM�����A�X�^�dT?�[ᆮ�Q�S�(�E����m���
e&�,�KMޫ��/0�%�g�A���r��B�Ƴ��BL��j�y�xQ]6,����W�_�Ga�&dn�Z�c�yt�]i,����?3���U��Б�n��|��_��/��3��� �s���G0��KH�|n�ƜO�D�(�YɅZ����B��
*�������BA�e�AE�P�2��睵õ�N��Y�����>��C���i}*b�Ӽ��ӀB�jv�%��-�L����1�B?�Ż�"5���&���m�we�+��>���Q��+�ak�P'��N���X�)g��;0ed�Rz�X��,�/nB�P�s<1�:�I�k��%�]�O�a)�uz���jg��PK����9Hƣ9�D2���:����e�Ќ$��(�4Gɂ�-����M]�`X��B�[&��dA_+�D�=�p��~(Z�����x�g�~z>����NI�btt���|������7�Y��}���	PtM=��T(���Q�iZ�R�(�z����xbq�����KQl�p��L�s�%n)J+�;����%�� �4�z��fG��op������C�N��A��E7;q�9���T��w�4���rP3�����_��g�ͅy������������Hvj����`n,��w�U���6O�J6�ʋ�7�,�Ix�U�n�Ma������/^�CwJ���	�u��G\��?͓ �N	�O�E�o�c�cU��uWX����Q_&�z6�>"26�&]��R��`��oo��`v�o�4`\���e!Z_�M��)���N��)����z:��,�u� - h��c� w5N���=%�3���Հ�k-
�Ű�������uLL��]��a��̷��3�����*GT�l4�9R����mv�\DuO��	��e\��CN�u����u���Tk@������;;Y���N����xT������9" �A�hP�v`Q%�]Q���	..�Ӝm�'(�S۞��: ��9N�<>�3UUT`E���VV����'w4ȞMf�$�W��z�V/Ն(�(�h�� .NxR�<��	Z�
?�����ѯY��1TÂW���x�3���r-����NU��i��'Z�@~_�U�I��V���3c��.U���i]'J���X��1'��<��0 ��wr��8�e�P\l�J{���sӵ�Q��W���}�bmI����U�1l2F����`�gc����6&o>�M�/���=~�Q��K��-\�%�W�y��l_}^��x#-�G��e�ZiY1RV���e����2-���|w/������N�a�p�� �5.��C[�h~�9�`N���0��{i�����@�d��2��ߜ&�Z�g0�}�<���p5W��(��9������\��:��<xH�J�+#�cPI��5(�v'+֪݁g���o�����ڨ�&l*Z|�u�Z�f8	Tظ��fU3B����u��[F�e��w�!98_���%����OzW�א�����1�`K@�߽�)�^�->�u������E�Y�u����$�	n��y��v5��]]���l<�y�<�4��4V��jn�l}#���MV�	�����t���|J��ҹ/��*(��W����z�iz��S�d�> ��tVQ��g��8)k�����MVx­�=�I� �}�i-�/:��4�B�����h�{��F���Jf{���6��)���/��h�e�V�ԳCJ����W|�cݕܟ��P;a���U�q4"p��w��-~/ѫjG#?��:��1q�4�<O�L��+\!�/�
�㩈v�&u?$���:h��#���L�ᑍ�&h]�6/�h    X�hi 	E�tE��Y��jU��j�
ӂ ��I�o�Q�i�E��PN�D�:�W�k0}����մN�P��[jI�1ܼ�\k�^���fQ�6CG;�7�E�z��4\̂_:��^k֍�-|�u�}��j��qt݅�%ȇ���"�ݺ�A E�e;�NP\��T_S:��9�P}���!��V�}��o���s�E/�p%ԝm�K�;Z+{ �N��y�0M%(�P6�"�᳁��/�h���h����,%��E��7ႅ���'(׽6◲�b�tp�*.D�t���@˱rP�xU�v�� �.�,S����R���i];	]�Ҏ$3��>� H�ohp��a�H��^��@M����,�o�,ȹZ���c�3�L���ܑ�� �4�#�J�����X܇4S{��Y�3��r+�Y׆��p��+�M�v�P�%���g	ۓ�M�5�� �r�[����g�
��/R}�j��u[&Xy7TM�nB��+	�4n��a�R�h���v��
�g�G��z���luL�b�������͠e$��$�~c\�hl@1�9?`��5͏�$�G�A�L�5����U�c����c{f���*���o�
�$8�급l]Y&U�e�҅>�U���K͕��F�������a�t����e�=kJ<��i���!U�eza�8�h��?4f�=����y��GN��y��Gk��[M_G�v�s�y�v2�y�md�l�������L&E��9�|
��I��J�I�p[@���KI�tH/�h�Q�f�u},ת3�dk�D}��f~M��#X��o�Y�k>�͈68��	�v6�."�_�|��|���i��8��i���z��#ڍ����+���v�Q�K�vd�Qԇ��z8�~L'X�`{�<����!�如�Y����\�w��u��\WD���ȤN��@��l&g��@�9U�71�m`7���4oL���=]�Yd>�o�YځaC�2�Y�2/~>�r��g
�mH�"�}�2���uW�.
����Ć*������t�s<Ǹ50k0� �^N��3D�{��f@.ޙ�ݸ뷈�홭�I��~H�p&
�{ȦJ�.G.��[�����^L��K�E|�8��&�
b�U�m�1-��r�MԬ)�����/��	>��H6骣_���5�yмTD����z�v@3nR�6��88�Z@��`l�
G����q
�n�C���d��9�))�4.��|)Q���� ����&g�T}�Ag�������t�D����M��
�.
Q)�V�_V���I��8=����^ڝ��[�$�|Sr_�(�n�1�œL�J2\/��qP�M�'�6��|�%V{��mo���*&�)�v��١d����=\���v*]a�T���̒ÔȨP�F[�ի�= %�3���Eo�����ի��݄�U���0P�@����q���δ����򔎏�Jxc�Z^ʻ�}�sl�J;@n,ܷIrx.ϰ:��&EE�?4��5�W��w�+���T���sIY�c�I/B�>r���Y��pA�ԣ��ˠ���5���S[��"�D���/Y�q~K������`!�6�u��˚��� ��=v��ĵ�Y��Pￏ�f��~��A;0�ײ�� �&u�{,��X7��6yMl�=��U��:t&;S�K�E��ì�^R���'���x'�/R�%H���]�Qs���»4�`��B�{2g�u7~ �A���� 3WU����S��n���W]#��\4fTg���P
S0��qMg��R.������P]��eZ�xd&��u�׼���r(68� ��F�>�S;%I�}�g��W�qS�8��&��e�M޹�K��jR�N1`U��=t�pu&'@H�=���"�>����4�/���i ���C��J�M�a���"Ȓ�U�]���$S+���P��(��vDj���3;YƸ��8nw�mS+�������v#��$�k������d8oI��tϷʦ�#���i�SHz����P�~0����GRڦ��:K�t�Xx��]��I}#S���-�]C�=�&��:�ה%UU��NxJ;�V�-M_����{�,PS�͎��9�>i�i��-���<�"L����(�v�d
���m��JGA�y�r��8#�.�)%�͢?����|���g0��kC���6�[(ȍ�h�'�, ���6���I`�+�f��|�N8ED_�s���j����gl���r�4�ی�Y�	�8je&�>cW����R��8r�ی+���� acj�z�v�6}U���Iy�C������ n@o�{�p��C���עܨB7w�DǑЫ��0�Z�|��އ<�5�//-��K�9 ��������]�l�jX��d#�t���N6hPgkK(M�px�)p����n�'P<0���P�ik�	ЂH!ek�t�d�&'>���˴����L�Y@�V2bw�Z��"�_S��`�vO3�؆	<	�fx�������:eX�fuf}�B�w�?�rW ����g�\U�B;z�����;�J�5����:�Y 6�h�{���%�y��A��	UM� ��6)M���Z
d_��$�p�qW{|��,�&;:셚��_W�:i`4)q��Z���JmQ�Ϊ��	���x�tM�8N7h�e������Ԗ��f����H�� ��Ǣt�N�e�De3^W�*�>��n>��v�M�%�	�N�S�F^�� J��4/hi66n���c����#-퍕�@:�t���^����ӹm��5�Q�v�AW���#\���Dg�wj"�rv�C�EO�& �ޑ([Ѕ;J?���EGˇ�#�0���	t�m��l���j�k�Q��jj�*4(6!�Շ��O p����l�p�A�S��5(oRnC�P�� �h�
y+Ϧ������y��b�@�ׂ�&�2*=*���=����(o�7�"�I	����A>Z��c�W�FI���GTK�UaV*THd-ql��9�_
������T�[��̖�ԉ����&4�̈́ay�<�B��n�>�ڱr������I�o6�8��i����q�-@�v��z�@����\;`�vڭ�C-��~�{7��ͪ<:��W�F`z����������+:I(Ϗx첹�rK�]�4�M�0�����I�mx,sun�t�i���Q�q�тθ�Z}�rV=��@S�r�����5N�O����K��@.���e���r�8��A'�7ŅC]<��Ζ�h��i<D��7i�dݦ�C�C2p��Ժ�z *��]"%XP`�ã�q�.�&F�YƦ��2B�`�J�"��c���]�<6��j^0��tТ�a�&P���� �ٿBCB.:|����$��8�Z-��K�<
-�F
��=-�ki���2j�ns9�Lx׫҅;�2$lQb&*�Ql��l��rm���b53���C�d���<��h��e���yPѱV\�kn8"

��l�5Q_��:��:�L���BK�x���hq���űB��[y���,���cp!͕~e][���e�,'�mY1NVز�8Y��ec��oe�X�@ˊq�H�l�e�q��:�1�Oxnh���12�x��En�����Wu&�,�,Y3��m�e��Z)�Xi �Զ(���AHu:����ȬD���T�z�a�fR�.��uR�'��U�}sԪ�
:\M��Ő��./S@B���V��(r<�36A�o9lNz�3#=��]v�׉�	�:,h�'�5���(ٲl���Ҳb\�XP=W�z�d�qh�;u��1�6G�6C2k�l�5�C���{B0o�|'�ع�d����̠�ീ1�L�#�ocލG@��8� @��q � F�����_�Jg�;1�S&k<̼9��r��I��2�|�<g���1̊��*�p�.�UC#��%�pG:[��i�e����'ihpbηҗ�mC@�<�z������m����~�ʖ��`BVN�nK�\��ȴ4�<���\e 
�+�׈�O�E�+�a���B'�c/CqU{V    ��2٦Ͼ`�a|"Li@�!b"D8��1�`���h���|T���(b"}����菖G沤��q�7�)�z�{IK6܀/>�^ɞ"����Tx+�S��rt��k�3�(%�iQ>0V-��7�?�~�O�.I�@7܍w��,Dh)D�x�s�P*:���x[-~�U�>�A�Uj��]:��l������/��S+>*�PߜM�ǣ�c�C� JG�4)�li>Vڵ��XifK{c��-폕�t0Vڳ�ñҾ-��Zi6Z[�Ж��#[z���V���������1[z����-=�{G����_,�l��;�m��_��51>�-=:�-=RS���[�2�6���֩�Y+=��*inK��[��crMI]csM��oK�I��Z�q���C[zt�Q+=��������������ޠZU�'|:OwEm�*1!�b@��_r}�?f4�O��N��L�Yx��8�{6q��I��t$��k�{�h�v�#9W@��P6�O�)Ft�@�b����E���ٻ�=����ri�j�$�������g�ɓ��:�p�J
���N�6H�"(lAl(�E�Η�Ļ�3�@D��x1�x:6�l����s�$C�.q�;�y�=�������H�6Bo��W�Q�c�.ǵ\)�3r�V�hU]��p]��WZ��X�\��!EwI�����:qOI)�+-әDb�[U��Q,�}@��cF�����PS������>SU�� �ҋ�Pˣ#�~�JkQ�=��*�I�J�]u���{��	9�&�Y?"�54>�2����S�}�7;U��5��tp��DĦ���O�Ć�~�#�G�OI1BR��Uj�	h$.��FPm�� 6R��)�Y�i�^�i���3���>f1��#�$\���p�y�n��Z�`
fQ�d
�q���t�����R���Y ��Y _��M
�,tv�u��r	l��|}�h�����M�Z>��������4��t^�h]0���c$_,��b�� ,��`Lj�q�w���q����%�����C%69��	���K�g�ZK!B�6�>�kD0\���t�8���T���Jd��G��j�#8�R?������I\%��6{�F�u����@�WZ����YI%��'ܤ|��7��� �6�k	a�B���q�_�[��@=>�	ϧt��/��(̵0)������ѝ��tJ0\f�'x�Asi�FYϒe#e}-덉Vex aU?� :��{\ˍ�7̵�@�P����h�����1����Ņ�=�Wc����0��Gc|�Z<-�UE �oE�G���{�� ���|64�R<M9?Jg���������t� QJ��&��3��R��Y��C�������u+�F?YԘ����"��K��<n��P���4���D�n%s^�����������~�)`��pe�����פ��<�j�tl\��Ll��	��m�*>n�w����0���{�����y&���F�Z�Sd���EmG�܃V�vf�5��P_�)lb�� �ZCa��\�gk����I��)a��՚#�h�A�)���S��S� �)y�z	��F!���<h�R��C$��FvͶ��RX��;�:��o��G�����S�Xj��B�i��,���p��Qa>�E����|������<�E���1�qn
��G���J ���}6�������X˳ ��'ϝ�Pw�sɟ'ϝb�9-��yz��#��p��鏃=�<�@.K�:_@9�jIe�:���h���9��B��#��b�{�--B{1K��#B�3
1�%8y�b� CAr�����s�)�QIk�Q�X-����#���|m�.�'m��>�¬Y��!ۺ��qq�����L����)��8�����wN�_p=l�k�=����F��n����m�負�$˟�G\lp��|�'W�n�R�%5���?C+�����t�9ސQ�)�
��O}:����_M\*?T�ڮ"���������_N�����%ךn�fz0�t\�Tί۟��]��1����]E�|k�F�`�*Y�z-��l'g���d��[���W!��
ġ�ko��˘����OMָ��Ǉ�GM\.1T��:���}6|��K{s89�d�Ii7ؕ���&k�vߏ���&c�QF���M4|'���q�9|�'盬q�9v���M��2�5��?QT��2\1A������>�e��~�BÈO��G���C]q�(���t@WO��u.�LW��4�*���>�G��I5p{��yұ^<һ�����{�vM���$쩔��5m��]#�R�XC�\Q�7{.Fl~��XB�:�Im{H�}�SU��lvH�f��!�M᝿��3	g�_��joxGu��,��)������Nc�c;KG�X�p9���@A�.��n:B���QKC9�G��Pl�y\ȂR�	M�_pCc(���^��_��юϡF|�4ř	26%z�=��_b��~Ms<-E��F�j�PB�>�Ô�y]��'\�2�E�ۜ�6b����o�Wj����.;�*Qeg�!�8�ֹ�����G��1y�)�����鯦cCP��$�G�S���|�kb��d8�2�!�-&��+@}Ї?h�tec���S�=���t�!��k��bSs���&��<D��DG�v�>�c��ON�b�`���	� G/CĞh�O�`!z���������n��,��E�]�^'���cy�����1������d��1����][{���B�.��}����P3�e�N1�6�eJ��I/yj֩r:��{����8K���ˈ�t���F�eqe��*���`��4���N�OC�b3���Vk�8�N��by�,��j������ m�FH5��̛Fi�C�/^�=�ޤ�7 a���0����RP��t���޾��l�-��9�ܷ��w�tt!o�5^Xz��6����Q����xB�b]R��A1y
�sŪs�����N����3M���@�la�^����nǟ�[5��Ȫ�A�B�"u������f��S¦�AJ����fסs�*r:ݦ�}q��Lw
���s��tx�h�}iB4Z��g,©�={1x���Ԯ��9!��5�J����
�H�@BZ��[Є�hƶ_�VI����]ŷ��T��H#��?g�	��$h�N��_���4!'�3�F��z��)a����H���4'���N=��]y�����y+����볞���D;i��M�ڢ--h�#���Dw�b�f!�B߂�O��u�g�^U��Ρ�y��xHߛ.����Hՙ������!�8���"��H �n��L�#%kW��z����)�|�_�)��S��p��z4g�5�� =�2k�F���2����JVvrυ�@��n�l,����l�4[ii1 �몀u$s5�������b�a�q#��ytMX���ȰA2��	����}�_�W�Wߡ�>!���O��ԁ���1�0-�����5���y4?��	��[M�y�x�'8��4���1����)6���فߎ��<���TY�ԙ�t��]Ask�?v��J�G�l���[�&�Q�!u�>�w�)��eǟ��&��ug�f�nfFy���2������uuB�&}5R�\��+g��j�iRL�W�(���>���zv�SG�V)vj�T���d�aow�)�_�@��&��i��u��:T�(h����W��EE��ݜ{��Z��G����j�=Vg&9x����4������1ы�����Z���g\d��>��� ;�15�I^�n�x����Yy�	��W�0Ci!��d{�Z_i�#��lK<ڎW����D��5����|<���n�3Pc�*���!���`7�?*��.��>*֍xF�����BO�o�c�w0`|B����-<dKh��/��:������<Yp�����ފ:����t>�ƹ���K\FV��i�$�d�{��k�CAH��rQ"��j�Ux��_K�;u�q7�MQVh���������;�=�<���`e�W+�!�4���ƃ�(xZj�KCW	e�r �  �5���&�X��a~�jS�"�Ӡ��� wd=�î����C������i Y8�,�k��&^�{=g�Ҹ�)kƟj8v%���b�CK�s~j���N ;�/(#�S�%��8Hu�A@V`)�[o
�����:K0}��ZM6�yuʞ$���C5��F^�<���n;��������K�����׸�I���&S,��s��=�X��'5>�ƻ�)�x,�^����O���ܫ�8�y��X�6�K��w���q^�.��ʜ�'�ؖ`��:ƫeuj�D2s�8O.����Yz)*쨗ϩ�:UkL��f�T�p��!�)�d�y;LÀ����}��}��UR�9��d=,�g�COGG�_�M�C8[|<��UM�8������>�u�H��m�� �k�UeCT 4�j#Gf��c��r������*�3��A�M���=��aW7n�N��vW��'�&K�[��S\��&�{�:��i��!���~�Č�*�>����9�3A���n�#}�#�B��j�U5�T�-t�� 7�>����ǡ�}�N��vm4�)��hqS4��m�@4	�y@�1���`�v\I;jG�)`2�|�3�Ǻ�H��q��X�j#�9���v��n��+�빏j�^&����vz��7���byD�l��x�����_�~��y����]���,���1'ݬC�TIJ��7�UA��cq`$ʓB{d�����1Μ_�2Q���^Ћ�6�KX�0�SqƢ�'��o�c���#F ���S���"o�i��;+��U��3\A�|�զwD�g����1��_ByZh'f/�u���K1�����s-�q^͵qq^�8w��,���ѥl�_��%��;ɢ������Ǳ=���g�@^&�u]<�i�3�/s=$)?�z�_�KM��.��*Q����K�����Gt۩�V0�����������B_N�\��r��=����e�`Tң]�<��0���z���gӋ1'�ny��Y�å^�d�z�1�V�6Ce���|��"���$���o�A���6?����]��ֳy�2���N�)vE�ƣw�^J�����ΑK�ّ�hYn��EE4p���0vh�n-�PQ��*>ָ��T-Nպ�<"6Z���c۫9`5-��0���4I�C:s�-�����% _�"٩O�kޢ�}w@{�0K�*�ubm
/Y�Ӣ�O��vʜ7��m/�ToS���;?\��_�N��]�Y��M�<�2K���>1B��/��Ϡ*�܁��� ɦ�i�Zy�Ub2Fח�@�}T�#����K�����dOA�����u����!��?z���9�Iƺ^��^J/9�����S
��%�V/���}?$U��PH���#�ґ���v��ƹ���Ʉ�*��6q/�9����k���Bէ�ф����p���Қ�j]����&�^��!�R��s��5Q�1���/P���J��R�A�mp�m41ʉ�'��K5n���G��j�[SQ�.�6�9:�B��CTύ�tHʻ�j|�}�Pџ����#�~nr祼��g]!o��Ò=�y��?3:ӡ�f�qP�xL�g:_6z4roN-|6��q���3�sI����Ϩ��i��>��4Y���F��.U�ϳ�ˀ�P�%�94��t(;��}4U����g:2�v-.�,�A����2������P�C*�ۡ_j����B_+��*���%��^����7�/y*_J� �����)�������g��x>S-��10S��bg}��G�(����3�%�\��x*9(��^���]���/,d�?��Bf�`�4;�ץFh��EA�EG#��*>�;]�텖D3�ɼ��5�;0;��w�k�1�O�������J�*]���r��.W�%J��.�M��=�B'%�OE��f"�0�{#��l�bn6�ʷ���pt8.JP٪w��-M�j��<&,ޖǭ�����Z�;��ˁ����Z.��M���            x������ � �      
      x������ � �      �   0  x�EP�N�0<o��? �Ӧ-�
DU	�����!���u����[U=�ifv�vc��6w�nI��4�#'ɘ	����ڶ>P��lz�(f�����t4�O���^��FWt�Y���~�KQ(GL��3�zT�RYMca;�R�t�3A%埸@\)��ݢVZ��O�R��.)�Ĝ]���}S���B�`�򱘭X��U��8 ��S������DB��S�9M�̓bm��M�{�	o_�bkh�Ϙ3B�\F��\Ie-�W����0�Ÿ7�)^G�P�y���"i`��&�<�!�s.&�%��}UU�����            x������ � �      �   e   x��;�0���S|������.i�@KL�3����0j�+���/�v��~�(+�*vg��gr�Sp��[����#;L���yWѓ���g'      �   �   x���;n�0��>OP�y���d�Т��N]�I��!RM}�*�fY����dS)մ�SP��I3�=�����N�-��i����~�n�}�t��p4�a'#A��ԫ�6�f!s���(���$��>�Ỉ�$r����[�h��mr7y��bx4���\$�I���'��]Bۅ�荐��%�%���޸�ep�z�"�9�������ۼ�{ۨ��y7]�},c��X�诧��� �L3�      �      x������ � �      �   <   x�3�tK,�H-�2���3�9�3�r2�ҹL8��K�S�L9݊2S�R��8��jb���� 
k�      �   5   x�3�tL����,.)J,�/�2�t�O1�9K2S�J�L8�J��S�b���� }m      	   *   x�3�tL.�,K�2�tIM1KRS��9�r򓳁�=... �,
�            x������ � �      �   w   x�3�4�!���L�N###]]Cc�?�<.��Ԝ�|�4b��r���)8��%o%X#P�G�B@Feqfrfb�6��t��`NcNc4m�����<.p؀�!�)AM1z\\\ ˼O      �   n   x�3��-�������L�O��2\�S�s3s���s9--��LM��89���9#1/%3=�(�3�4/+1���O�,���/-NU��W045�QNM.�/R0������� �j�      �      x������ � �            x������ � �            x������ � �             x������ � �      �      x������ � �         �  x�}�W�&�F�5����@I���%�	>j�6�20ht�����y�1��"�L�"�q�aq�<���i]am��l��Ȋ�G���y��3�)��PR)1I��)����W��9���1�QN��w���Z=��Ҟc�Sb)C"#��m�^�f���2���=�+'��w�w�(F%��eZ�N�^H��yw/5��Y[�2#��׭#O�� %��iW�;:����E�Sc�Æ�ZSGd^+���|��hi�X���Z��;H!Qj�W^3!��G�ҥ�Y�H��&����;AL7=�'�*&�jw�*i1��W�Cj�i�]�_��&넛��v��n��O��ӡ�u�h�o�s�^Ԯ��]Iyj��1]^[�:-Ge��m�rZ�^��v��	�sQDNq.�bwn-뻒fk���b��O�6�u��g���rt'�7^!WhW;7V��ie���]�;�z���D��⬗v��r�N�VXY7�v��7�vg�c�:��W�;ޔ�<�WUO�t�ۺ3՝[�7��z2��78�2ӵ��˫70�0�#H���x�n h��]�vx�ijg���٨i,{u*�7�vS���:�}�a��F��Y��T����%��{H�ם"W���R\S+{P���,����0�6�]�:�bJ�k�]�ez�J�G+L_�P�n��Yz|�;��h�� x=��Y�S�ʉt�<�����:y�~`��op�������>�XH�g�£�]�	�1���k�5
~��+I܇Ӟޞg��l&h-�t?�@K����R��!Xv!�)�L�%q����}*`ZLO��8�(Y�4U�lW�!�Nh�@�/��!0K����(��l�Գ�.];��3��
�ٿ+ɡxw�2��y^�������i@w���Z��2ݐ�*�{�j	�WZw�x��|{8A�Y�2v86���x�g*A�l��J�z�کߕHX�'3�!�Φ!Q���%+%18br�I����`�k+s+���i�g%����+���%4���1���&c�lY�$^0^�6`�>��rs8�;Hw�C��-���,6G�wt��z(f��2a�J\�K���i�n���m,� f\:8TH��)}ԝ٭y?њ�0���P��Y譖��w��wM؇�D�)����EI��r�m^���Dc�g�>�a�e��� �JW�~@<I�֟<Z��5-��3Zp&A�x�la�л����gI���'����ĩ���6�<�t�e���g�.9n�����PRU���������5Pv`�_���#��` <��RI#��H�R`i?��{�츍� �����,(��.VX����Z]�-���X�IM�����RX��=�R��z�9l_��z6w�q���������wk~ʨ�L��sqC�P�+�AZ`�t�Ec{M(
!>��Ig��jk����eQ$�]��a�N)E���͕��n���j��ٵ4e�f��b$����5jƵ�) ^��� �j3��->��M�8��Oc�>v��6t3���	���[�7G��:X���A4\���Y&���7|��u�r��]�M���h��	�6Wz�_6 <�� �(�s��r���s�M?N�{_�Gk���s+x�4�s٘��m$0���A��s�I����}Q��ġ���a��CI!r��ruuu��3H{n��O����
` �� �;1�q>���:���8O��J�1ܮ�߃$������<��t=�+'do�9~`�ڶ��fD��Uu�bZ�7�Q廾�� ���H���LW�j�#j�d)W:,�K��m���BO�����x�i}��#j���m����v��ʅ4��33�cV�,E���Hc-H���=i6Ǩ!�(8��}^X�s;�9$x��A��bp���/��o�YΩ���QyU h��$�mWb���{����,�����0e�\��nx�����I�Ìb�/����}�[x����ʡ��=�J�,̙pg�Y�`4a���,��_�~�	Oj�x      �   �  x���[o�@���S�Q��I�u�Eiӗ)��\��O_`k��M�N����ψ EM �$[��?M��nS<�IȽ�l��1�����F�h���[�F�V
�;�!��n@H�5 ���s�`��'9_b܀����źQF5�7��~I0�o2��"���-Y_��������Y=G�<ѣr��{ߝ4C��e�C���0we�t	�R�]�kw�.��,�4�u��`�"�3�dщ��%�b~������f�������H	����.�]�W}��/��)'F�_I�+yZKŚ0�8�p��Wӑ#�2�Oƒ��p���3��p	�d[_�_'��<�v5aT$��h�o~|VZHJ��̜��Q=�����Ug0����ǒ���w!Ӝ��=������r*1_�{�πxtm#�-���{��A�F��=0��#�_������f;�	o�*s ta��u �ٯD����!E�oxPc#�6�$5Em=���9��p��������٦�}e��O�Υ��t�����\1��ޅU/*����,��;_����Cb ^�n���X�yo��@=;T�+
(�9���cJ��oA&�����_�5��+���@��V��O���Q��Y��� ����      �      x������ � �     