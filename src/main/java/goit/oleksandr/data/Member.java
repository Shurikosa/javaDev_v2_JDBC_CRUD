package goit.oleksandr.data;

public class Member {
    private String firstName;
    private String lastName;
    private String email;
    private int flatNumber;
    private int area;
    private String buildingAdress;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public String getBuildingAdress() {
        return buildingAdress;
    }

    public void setBuildingAdress(String buildingAdress) {
        this.buildingAdress = buildingAdress;
    }

    public int getFlatNumber() {
        return flatNumber;
    }
    public void setFlatNumber(int flatNumber) {
        this.flatNumber = flatNumber;
    }
    @Override
    public String toString(){
        return"\nFirst Name: " + firstName + "\n" +
                "Last Name: " + lastName + "\n" +
                "Email: " + email + "\n" +
                "Flat Number: " + flatNumber + "\n" +
                "Area: " + area + "\n" +
                "Building adress: " + buildingAdress;
    }
}
