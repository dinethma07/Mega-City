package com.datapackage.model;

public class Reservation {
	   private int id;
	    private String name;
	    private String email;
	    private String contact;
	    private String fromLocation;
	    private String toLocation;
	    private String date;

	    // Constructors
	    public Reservation() {
	    }

	    public Reservation(String name, String email, String contact, String fromLocation, String toLocation, String date) {
	        this.name = name;
	        this.email = email;
	        this.contact = contact;
	        this.fromLocation = fromLocation;
	        this.toLocation = toLocation;
	        this.date = date;
	    }

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getContact() {
			return contact;
		}

		public void setContact(String contact) {
			this.contact = contact;
		}

		public String getFromLocation() {
			return fromLocation;
		}

		public void setFromLocation(String fromLocation) {
			this.fromLocation = fromLocation;
		}

		public String getToLocation() {
			return toLocation;
		}

		public void setToLocation(String toLocation) {
			this.toLocation = toLocation;
		}

		public String getDate() {
			return date;
		}

		public void setDate(String date) {
			this.date = date;
		}
	    
	    

}
