// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// MARK: Task 1 - General Setup

class Patient {
    var name: String
    var age: Int
    var validHealthCard: Bool = true
    var symptom: String?
    var prescription: Medication?
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    // Method to Visit Doctor
    
    func visitDoctor(doctor: Doctor) {
        println("Patient: \(self.name) is visiting \(doctor.name)")
    }
    
    
}


class Doctor {
    var name: String
    var specialization: String
    var acceptedPatients: [Patient] = [Patient]()
    init (doctorName: String, doctorSpecialization: String) {
        self.name = doctorName
        self.specialization = doctorSpecialization
    }
    
    func acceptPatient(patient: Patient) {
        if patient.validHealthCard {
            println("Doctor: \(self.name) accepts \(patient.name)")
            self.acceptedPatients.append(patient)
        } else {
            println("Doctor: \(self.name) rejects \(patient.name)")
        }
    }
    
    func givePrescription(patient: Patient, medication: Medication) {
        if patient.symptom == "Headache" {
            patient.prescription = medication
            println("Patient 1 received \(medication.name)")
            
        }
    }

}

class Medication {
    var name: String
    init(medName: String) {
        self.name = medName
    }
}

enum MedicationType {
    case Painkiller, Allergies
}



// Test - add instances

var patient1 = Patient(name: "Mike", age: 35)
patient1.symptom = "Headache"
var patient2 = Patient(name: "Crackhead", age: 60)
patient2.validHealthCard = false

var doctor1 = Doctor(doctorName: "Doc 1", doctorSpecialization: "Throat and Nose")

var med1 = Medication(medName: "Asprin")

// Patient is visiting Doctor
patient1.visitDoctor(doctor1)
patient2.visitDoctor(doctor1)

// Does Doctor accept patient?
doctor1.acceptPatient(patient1)
doctor1.acceptPatient(patient2)

// Check Doctor registry of patients
doctor1.acceptedPatients.count // Success!

// Request Prescription
doctor1.givePrescription(patient1, medication: med1)



