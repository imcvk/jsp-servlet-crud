package model;

import java.util.Date;

public class Subscriber {
    private String subscriberId;
    private String first_name;

    public Subscriber(String subscriberId, String first_name, String last_name, Date date_of_birth, Date date_of_joining, String address, String email, String gender, long phone_no, String username, String password) {
        this.subscriberId = subscriberId;
        this.first_name = first_name;
        this.last_name = last_name;
        this.date_of_birth = date_of_birth;
        this.date_of_joining = date_of_joining;
        this.address = address;
        this.email = email;
        this.gender = gender;
        this.phone_no = phone_no;
        this.username = username;
        this.password = password;
    }

    public String getSubscriberId() {
        return subscriberId;
    }

    public void setSubscriberId(String subscriberId) {
        this.subscriberId = subscriberId;
    }

    private String last_name;
    private Date date_of_birth;
    private Date date_of_joining;
    private String address;
    private String email;
    private String gender;
    private long phone_no;
    private String username;
    private String password;


    public Subscriber() {
    }

    public Subscriber(String first_name, String last_name, Date date_of_birth, Date date_of_joining, String address, String email, String gender, long phone_no, String username, String password) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.date_of_birth = date_of_birth;
        this.date_of_joining = date_of_joining;
        this.address = address;
        this.email = email;
        this.gender = gender;
        this.phone_no = phone_no;
        this.username = username;
        this.password = password;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public Date getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(Date date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    public Date getDate_of_joining() {
        return date_of_joining;
    }

    public void setDate_of_joining(Date date_of_joining) {
        this.date_of_joining = date_of_joining;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public long getPhone_no() {
        return phone_no;
    }

    public void setPhone_no(long phone_no) {
        this.phone_no = phone_no;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
