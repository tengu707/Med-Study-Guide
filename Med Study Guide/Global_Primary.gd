extends Node

#Global Variables saved here
var level_selection = "Multiple Choice"
var seed_selection = ""
var level = 0

var primary = [
	{
		"chiefComplaint" : "chest pain",
		"ageMin" : 40,
		"ageMax" : 100,
		"spineStabilization" : "no",
		"mentalStatus" : "Alert & Oriented", 
		"airway" : "patent",
		"breathing" : "labored",
		"circulation" : "weak pulse and pale skin",
		"priorities" : "cardiac assessment, treatment and transport"
	},
	{
		"chiefComplaint" : "unresponsive",
		"ageMin" : 0,
		"ageMax" : 100,
		"spineStabilization" : "yes",
		"mentalStatus" : "Unresponsive", 
		"airway" : "unprotected",
		"breathing" : "not breathing",
		"circulation" : "no pulse",
		"priorities" : "Compressions, BVM with O2, defibrillation"
	},
	{
		"chiefComplaint" : "toe pain",
		"ageMin" : 18,
		"ageMax" : 100,
		"spineStabilization" : "no",
		"mentalStatus" : "Alert & Oriented", 
		"airway" : "patent",
		"breathing" : "regular and unlabored",
		"circulation" : "strong and regular",
		"priorities" : "secondary assassment"
	},
	{
		"chiefComplaint" : "chest stabbing",
		"ageMin" : 18,
		"ageMax" : 50,
		"spineStabilization" : "no",
		"mentalStatus" : "Alert & Oriented", 
		"airway" : "patent",
		"breathing" : "rapid with diminished lung sounds",
		"circulation" : "pale skin",
		"priorities" : "chest seal and/or needle decompression, rapid transport"
	},
	{
		"chiefComplaint" : "Altered Mental Status",
		"ageMin" : 18,
		"ageMax" : 70,
		"spineStabilization" : "no",
		"mentalStatus" : "Alert & unoriented, acting drunk", 
		"airway" : "patent",
		"breathing" : "regular unlabored",
		"circulation" : "pale cool and clammy skin",
		"priorities" : "Altered mental status assessment with suspected hypoglycemia"
	},
	{
		"chiefComplaint" : "Difficulty Breathing",
		"ageMin" : 8,
		"ageMax" : 80,
		"spineStabilization" : "no",
		"mentalStatus" : "Alert & unable to speak", 
		"airway" : "blocked",
		"breathing" : "inspiratory stridor",
		"circulation" : "pale warm and dry",
		"priorities" : "Chest thrust and back blows to dislodge choking"
	},
	{
		"chiefComplaint" : "Difficulty Breathing",
		"ageMin" : 8,
		"ageMax" : 80,
		"spineStabilization" : "no",
		"mentalStatus" : "Alert & unable to speak", 
		"airway" : "partially blocked",
		"breathing" : "inspiratory stridor",
		"circulation" : "pale warm and dry",
		"priorities" : "Oxygen via non-rebreather and careful transport"
	},
	{
		"chiefComplaint" : "Difficulty Breathing",
		"ageMin" : 1,
		"ageMax" : 80,
		"spineStabilization" : "no",
		"mentalStatus" : "Alert & oriented", 
		"airway" : "swollen",
		"breathing" : "inspiratory stridor",
		"circulation" : "normal warm and dry",
		"priorities" : "Oxygen and transport for liekly croup/epiglotittis"
	},
	{
		"chiefComplaint" : "Difficulty Breathing secondary to facial burns",
		"ageMin" : 1,
		"ageMax" : 80,
		"spineStabilization" : "no",
		"mentalStatus" : "Alert & oriented", 
		"airway" : "swollen",
		"breathing" : "inspiratory stridor",
		"circulation" : "flushed warm and moist",
		"priorities" : "Rapid intubation and transport"
	},
	{
		"chiefComplaint" : "Difficulty Breathing secondary to bug sting",
		"ageMin" : 1,
		"ageMax" : 80,
		"spineStabilization" : "no",
		"mentalStatus" : "Alert & oriented", 
		"airway" : "swollen",
		"breathing" : "inspiratory stridor",
		"circulation" : "hives warm and dry",
		"priorities" : "Epinephrine 0.3 mg of 1/1000, anaphylaxis protocol and transport"
	},
	{
		"chiefComplaint" : "Difficulty Breathing secondary to bug sting",
		"ageMin" : 1,
		"ageMax" : 80,
		"spineStabilization" : "no",
		"mentalStatus" : "Alert & oriented", 
		"airway" : "patent",
		"breathing" : "audible wheezing",
		"circulation" : "pale warm and dry",
		"priorities" : " and transport"
	},
	{
		"chiefComplaint" : "Not breathing",
		"ageMin" : 1,
		"ageMax" : 10,
		"spineStabilization" : "no",
		"mentalStatus" : "Unresponsive", 
		"airway" : "patent",
		"breathing" : "no breathing",
		"circulation" : "pale cool and dry",
		"priorities" : "???"
	},
]
