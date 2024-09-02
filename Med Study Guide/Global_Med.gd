extends Node

#Global Variables saved here
var level_selection = "Multiple Choice"
var meds_selection = "Generic and Paramedic"
var week_selection = "1"
var previous_selection = "Yes"
var seed_selection = ""
var level = 0
var med = 0
var week = 0
var previous = 0

var meds = [
	{
		"week": "1",
		"generic_list": [
			{'brand': 'Vicodin®', 'generic': 'APAP + Hydrocodone', 'function': ['Pain Relief','Narcotic','DEA Sch 3'] },
			{'brand': 'Prinivil®', 'generic': 'Lisinopril', 'function': ['ACE Inhibitor','HTN'] },
			{'brand': 'Zocor®', 'generic': 'Simvastatin', 'function': ['Statin/Cholesterol'] },
			{'brand': 'Synthroid®', 'generic': 'Levothyroxine', 'function': ['Hormone Replacement'] },
			{'brand': 'Amoxil®', 'generic': 'Amoxicillin', 'function': ['Antibiotic'] },
			{'brand': 'Zithromax®', 'generic': 'Azithromycin', 'function': ['Antibiotic'] },
			{'brand': 'Microzide®', 'generic': 'Hydro-Chlorothiazide (HCTZ)', 'function': ['Thiazide ','Diuretic','HTN/CHF'] },
			{'brand': 'Norvasc®', 'generic': 'Amlodipine', 'function': ['Calcium Channel Blocker'] },
			{'brand': 'Xanax®', 'generic': 'Alprazolam', 'function': ['Benzo','DEA Sch 4'] }
		],
		"paramedic_list": [
			{'Medication': 'OXYGEN',
				'Class': 'Gas',
				'Indications': ['Hypoxia','pain management','anxiety'],
				'Contraindications': ['None'],
				'Packaging': ['Designated cylinder with regulator'],
				'Routes': ['Inhalation'],
				'Dose': '2 – 15lpm  35 to 100%',
				'Medication_per_volume': 'n/a'},
			{'Medication': 'SUCCINYLCHOLINE',
				'Class': 'Paralytic, depolarizing neuromuscular blocking agent',
				'Indications': ['Skeletal muscle paralysis for rapid sequence endotracheal intubation'],
				'Contraindications': ['Hypersensitivity'],
				'Packaging': ['Preloads','ampules','vials'],
				'Routes': ['IV/IO'],
				'Dose': '1 – 1.5mg/Kg',
				'Medication_per_volume': 'Preload 140mg/7ml = 20mg/ml ampules 100mg/2ml = 50mg/ml vial 200mg/10ml = 20mg/ml'},
			{'Medication': 'ROCURONIUM',
				'Class': 'Paralytic, non-depolarizing neuromuscular blocking agent',
				'Indications': ['Skeletal muscle paralysis for rapid sequence endotracheal intubation'],
				'Contraindications': ['Hypersensitivity'],
				'Packaging': ['Preload','vial','drip concentration'],
				'Routes': ['IV/IO'],
				'Dose': '06 – 1.2mg/kg ',
				'Medication_per_volume': 'Preload 50mg in 5ml = 10mg/ml, vial 50mg/5ml = 10mg/ml, drip concentration 50mg in 100ml = 50000mcg in 100ml = 500mcg/ml'},
			{'Medication': 'VECURONIUM',
				'Class': 'Paralytic, non-depolarizing neuromuscular blocking agent',
				'Indications': ['Skeletal muscle paralysis for rapid sequence endotracheal intubation'],
				'Contraindications': ['Hypersensitivity'],
				'Packaging': ['Preloads','vials'],
				'Routes': ['IV/IO slow push'],
				'Dose': 'O.15-0.25mg/kg',
				'Medication_per_volume': 'Preloads 10mg in 10ml = 1mg/ml, vials 10mg in 10ml = 1mg/ml'}
		]
	},
	{
		"week": "2",
		"generic_list": [
			{'brand': 'Singulair®', 'generic': 'Montelukast', 'function': ['Leukotriene Inhibitor Bronchodilator'] },
			{'brand': 'Sterapred®', 'generic': 'Prednisone', 'function': ['Corticosteroid'] },
			{'brand': 'Lexapro®', 'generic': 'Escitalopram', 'function': ['S.S.R.I.','Depression/Mood'] },
			{'brand': 'Advil®', 'generic': 'Ibuprofen', 'function': ['N.S.A.I.D.'] },
			{'brand': 'Celexa®', 'generic': 'Citalopram', 'function': ['S.S.R.I.','Depression/Mood'] },
			{'brand': 'ProAir®', 'generic': 'Albuterol', 'function': ['Beta 2 Agonist','Bronchodilator'] },
			{'brand': 'Prozac®', 'generic': 'Fluoxetine', 'function': ['S.S.R.I.','Depression/Mood'] },
			{'brand': 'Neurontin®', 'generic': 'Gabapentin', 'function': ['Anticonvulsant','Nerve Pain'] },
			{'brand': 'Coumadin®', 'generic': 'Warfarin', 'function': ['Blood Thinner'] }
		],
		"paramedic_list": [
			{'Medication': 'ETOMIDATE',
				'Class': 'Sedative/hypnotic',
				'Indications': ['Induction agent for rapid sequence induction/intubation'],
				'Contraindications': ['Hypersensitivity','significant hypotension'],
				'Packaging': ['Preloads - 40mg in 20ml'],
				'Routes': ['IV/IO'],
				'Dose': '0.3- 0.4 mg/kg IVP',
				'Medication_per_volume': '2mg/ml'},
			{'Medication': 'FENTANYL',
				'Class': 'Narcotic, central nervous system depressant',
				'Indications': ['Adjunct to rapid sequence sedation and induction','analgesic','chest pain'],
				'Contraindications': ['Hypersensitivity','severe shock','severe hemorrhage'],
				'Packaging': ['Vials','ampules','paste'],
				'Routes': ['IV/ IO','IN and transdermal'],
				'Dose': '25mcg – 100mcg in 25mcg to 50mcg increments titrated to effect\nRSI Dose: 2-10 mcg/kg  IV',
				'Medication_per_volume': '50mcg/ml RSIDose: 2-10 mcg/kg  IV'},
			{'Medication': 'PROPOFOL',
				'Class': 'Sedative/ Hypnotic – Anesthetic',
				'Indications': ['Induction and maintenance of intubated patients'],
				'Contraindications': ['Hypersensitivity','allergy to eggs or egg products  Caution with Etoh'],
				'Packaging': ['1gm vials  Add 1gm to 100mL for drip concentration – can add to more volume and adjust'],
				'Routes': ['IV/IO'],
				'Dose': '1.5mg/kg',
				'Medication_per_volume': '1gm in 100ml = 10mg/ml = 10000mcg/ml'},
			{'Medication': 'MIDAZOLAM/VERSED',
				'Class': 'Tranquilizer (benzodiazepine)',
				'Indications': ['Premedication before cardioversion','acute anxiety states','seizures'],
				'Contraindications': ['Hypersensitivity','glaucoma','shock'],
				'Packaging': ['Vials'],
				'Routes': ['IV','IO','IM','IN'],
				'Dose': '2.5mg – 20mg in 2.5mg – 5mg increments titrated to effect RSI Dose: 0.1-0.3mg/kg IV',
				'Medication_per_volume': '5mg in 1ml'}
		]
	},
	{
		"week": "3",
		"generic_list": [
			{'brand': 'Glucophage®', 'generic': 'Metformin', 'function': ['Antidiabetic'] },
			{'brand': 'Lipitor®', 'generic': 'Atorvastatin', 'function': ['Statin/Cholesterol'] },
			{'brand': 'Prilosec®', 'generic': 'Omeprazole', 'function': ['Proton Pump Inhibitor','GERD/reflux'] },
			{'brand': 'Augmentin®', 'generic': 'Amoxicillin + Clavulanate', 'function': ['Antibiotic'] },
			{'brand': 'Tenormin®', 'generic': 'Atenolol', 'function': ['Beta Blocker','HTN'] },
			{'brand': 'Lasix®', 'generic': 'Furosemide', 'function': ['Diuretic','CHF'] },
			{'brand': 'Lopressor®', 'generic': 'Metoprolol', 'function': ['Beta Blocker','HTN'] },
			{'brand': 'Zoloft®', 'generic': 'Sertraline', 'function': ['S.S.R.I.','Depression/Mood'] },
			{'brand': 'Ambien®', 'generic': 'Zolpidem', 'function': ['Sleep Aid','DEA Sch 4'] }
		],
		"paramedic_list": [
			{'Medication': 'KETAMINE ',
				'Class': 'Analgesic, Sedative, Anesthetic, Hypnotic',
				'Indications': ['Sedation including combative patients','induction for RSI','moderate to severe pain'],
				'Contraindications': ['Hypersensitivity','** emergence reactions occur in 10% of adults (vivid terrifying hallucinations','delirium','irrational behavior)  Versed eases emergence phenomena'],
				'Packaging': [''],
				'Routes': ['IV/IO/IM'],
				'Dose': 'Analgesia – 0.3mg/kg in 100ml IV, 0.3mg/kg IM, 0.5mg/kg IN\nAnesthetic/RSI - 1.5mg/kg slow push IV, 4mg/Kg IM',
				'Medication_per_volume': '100mg/ml'},
			{'Medication': 'TRANEXAMIC ACID/TXA/CYKLOKAPRON',
				'Class': 'Antifibrinolytic',
				'Indications': ['Trauma associated with significant hemorrhage'],
				'Contraindications': ['Hypersensitivity','suspected CVA','MI or PE'],
				'Packaging': ['vials'],
				'Routes': ['IV drip'],
				'Dose': '1gram in 100ml over 10 minutes',
				'Medication_per_volume': '1gram/10ml   1 gram in 10 ml'},
			{'Medication': 'MORPHINE',
				'Class': 'Narcotic',
				'Indications': ['Severe pain','pulmonary edema','chest pains'],
				'Contraindications': ['Head injury','volume depletion','hypersensitivity'],
				'Packaging': ['Vials','carpuject/bristojet'],
				'Routes': ['IV/IO','IM'],
				'Dose': '2mg – 20mg in 2mg-5mg increments titrated to effect',
				'Medication_per_volume': '10mg in 1ml'},
			{'Medication': 'KETOROLAC/TORADOL',
				'Class': 'Nonsteroidal Anti-Inflammatory Agent',
				'Indications': ['Mild to moderate pain'],
				'Contraindications': ['Hypersensitivity','aspirin allergy'],
				'Packaging': ['vials'],
				'Routes': ['IV/IO','IM'],
				'Dose': '15-30mg IVP, 30-60mg IM',
				'Medication_per_volume': '15mg/1ml'}
		]
	},
	{
		"week": "4",
		"generic_list": [
			{'brand': 'Percocet®', 'generic': 'Oxycodone + APAP', 'function': ['Pain Relief','Narcotic','DEA Sch 2'] },
			{'brand': 'Nexium®', 'generic': 'Esomeprazole', 'function': ['Proton Pump Inhibitor','GERD/reflux'] },
			{'brand': 'Ultram®', 'generic': 'Tramadol', 'function': ['Pain Relief','Narcotic'] },
			{'brand': 'Klonopin®', 'generic': 'Clonazepam', 'function': ['Benzo','DEA Sch 4'] },
			{'brand': 'Ativan®', 'generic': 'Lorazepam', 'function': ['Benzo','DEA Sch 4'] },
			{'brand': 'Keflex®', 'generic': 'Cephalexin', 'function': ['Antibiotic'] },
			{'brand': 'Flexeril®', 'generic': 'Cyclo-Benzaprine', 'function': ['Muscle Relaxant'] },
			{'brand': 'Septra®', 'generic': 'Sulfa-methoxazole + Trimethoprim', 'function': ['Antibiotic'] },
			{'brand': 'Cipro®', 'generic': 'Ciprofloxacin', 'function': ['Antibiotic'] }
		],
		"paramedic_list": [
			{'Medication': 'ZOFRAN/ONDANSETRON',
				'Class': 'Antiemetic',
				'Indications': ['Prevention and control of nausea with or without vomiting'],
				'Contraindications': ['Hypersensitivity','< 4 years of age'],
				'Packaging': ['4mg vials','4mg sublingual wafer'],
				'Routes': ['IV/IO','IM','oral'],
				'Dose': '4mg slow IV push, 4mg sublingual wafer',
				'Medication_per_volume': 'Usually 2mg/2ml'},
			{'Medication': 'MANNITOL ',
				'Class': 'Osmotic diuretic',
				'Indications': ['Acute cerebral edema','blood transfusion reactions'],
				'Contraindications': ['Pulmonary edema','dehydration','hypersensitivity'],
				'Packaging': ['Vials'],
				'Routes': ['IV/IO bolus or infusion'],
				'Dose': '1.5 – 2.0g/Kg',
				'Medication_per_volume': 'Varies, vial dependent'},
			{'Medication': 'DOPAMINE/INTROPIN',
				'Class': 'Sympathomimetic',
				'Indications': ['Hemodynamically significant hypotension','cardiogenic shock'],
				'Contraindications': ['Hypovolemic shock without complete fluid resuscitation'],
				'Packaging': ['Vials and premixed bags'],
				'Routes': ['IV/IO drip only'],
				'Dose': '2-20mcg/Kg/min',
				'Medication_per_volume': '1600mcg/ml'},
			{'Medication': 'VALIUM/DIAZEPAM',
				'Class': 'Tranquilizer (benzodiazepine)',
				'Indications': ['Major motor seizures','premedication before cardioversion','skeletal muscle relaxant','acute anxiety'],
				'Contraindications': ['Hypersensitivity'],
				'Packaging': ['Vials','carpuject/bristojet'],
				'Routes': ['IV/IO','IM','rectal'],
				'Dose': '5 to 20mg in 5mg increments titrated to effect',
				'Medication_per_volume': '10mg in 2ml   5mg/ml'},
		]
	},
	{
		"week": "5",
		"generic_list": [
			{'brand': 'Flonase®', 'generic': 'Fluticasone', 'function': ['Inhaled Steroid','Allergies'] },
			{'brand': 'Dyrenium®', 'generic': 'Triamterene', 'function': ['Diuretic','HTN'] },
			{'brand': 'Pravachol®', 'generic': 'Pravastatin', 'function': ['Statin/Cholesterol'] },
			{'brand': 'Crestor®', 'generic': 'Rosuvastatin', 'function': ['Statin/Cholesterol'] },
			{'brand': 'Plavix®', 'generic': 'Clopidogrel', 'function': ['Platelet Aggregation Inhibitor','Blood Thinner'] },
			{'brand': 'Coreg®', 'generic': 'Carvedilol', 'function': ['Beta Blocker','HTN'] },
			{'brand': 'Paxil®', 'generic': 'Paroxetine', 'function': ['S.S.R.I.','Depression/Mood'] },
			{'brand': 'Mobic®', 'generic': 'Meloxicam', 'function': ['N.S.A.I.D.'] },
			{'brand': 'Valium®', 'generic': 'Diazepam', 'function': ['Benzo','DEA Sch 4'] }
		],
		"paramedic_list": [
			{'Medication': 'OFIRMEV/ACETAMINOPHEN for INJECTION',
				'Class': 'Analgesic and Antipyretic',
				'Indications': ['Mild to moderate pain in place of an opioid or\nadjunctively used with an opioid for a lower dose  Fever reducer'],
				'Contraindications': ['Severe hepatic impairment or liver disease'],
				'Packaging': ['100ml bag or 100ml glass bottle'],
				'Routes': ['IV/IO drip'],
				'Dose': '1000mg in 100ml over 15minutes',
				'Medication_per_volume': '10mg/ml'},
			{'Medication': 'ALBUTEROL/PROVENTIL',
				'Class': 'Sympathomimic – beta 2 specific – bronchodilator',
				'Indications': ['Asthma','bronchospasm associated to COPD','irritation','allergic reaction'],
				'Contraindications': ['Hypersensitivity','symptomatic tachycardia'],
				'Packaging': ['Multi-dose vials','preload plastic vials'],
				'Routes': ['Small volume nebulizer – or nebulized and “bagged in”'],
				'Dose': '2.5mg',
				'Medication_per_volume': '25mg in 3ml'},
			{'Medication': 'IPRATROPIUM/ATROVENT',
				'Class': 'Anticholinergic',
				'Indications': ['Bronchial asthma','bronchospasm associated with chronic bronchitis and emphysema'],
				'Contraindications': ['Hypersensitivity','not to be used as solo acute respiratory bronchodilator  '],
				'Packaging': ['Preload plastic vials'],
				'Routes': ['Small volume nebulizer'],
				'Dose': '500mcg or 0.5mg',
				'Medication_per_volume': '05mg/2ml'},
			{'Medication': 'RACEMIC EPINEPHRINE',
				'Class': 'Sympathomimetic',
				'Indications': ['Croup/ laryngotracheobronchitis','RSV respiratory syncytial virus'],
				'Contraindications': ['Hypersensitivity','epiglottitis'],
				'Packaging': ['Vial','preload 225% in a 20ml normal saline'],
				'Routes': ['Small volume nebulizer'],
				'Dose': '0.25 to 0.75ml of the 2.25% solution, 0.05ml/Kg in 2.0ml saline',
				'Medication_per_volume': 'Varies by brand'},
		]
	},
	{
		"week": "6",
		"generic_list": [
			{'brand': 'Diovan®', 'generic': 'Valsartan', 'function': ['Angiotensin II Receptor Blocker','HTN'] },
			{'brand': 'Cymbalta®', 'generic': 'Duloxetine', 'function': ['Antidepressant'] },
			{'brand': 'Effexor®', 'generic': 'Venlafaxine', 'function': ['Antidepressant'] },
			{'brand': 'Zantac®', 'generic': 'Ranitidine', 'function': ['Histamine Blocker','Allergies'] },
			{'brand': 'Diflucan®', 'generic': 'Fluconazole', 'function': ['Antifungal'] },
			{'brand': 'Aleve®', 'generic': 'Naproxen', 'function': ['N.S.A.I.D.'] },
			{'brand': 'Advair®', 'generic': 'Fluticasone + Salmeterol', 'function': ['Bronchodilator + Steroid'] },
			{'brand': 'Desyrel®', 'generic': 'Trazodone', 'function': ['Antidepressant'] },
			{'brand': 'Darvocet®', 'generic': 'Propoxyphene + APAP', 'function': ['Pain Relief','Narcotic','DEA Sch 4'] }
		],
		"paramedic_list": [
			{'Medication': 'MAGNESIUM SULFATE (10% Solution)',
				'Class': 'Anticonvulsant, Antidysrhythmic, smooth muscle relaxant',
				'Indications': ['Eclampsia','severe refractory ventricular fibrillation','torsade de points','severe refractory asthma'],
				'Contraindications': ['Shock','heart blocks'],
				'Packaging': ['5g vials of 50% solution'],
				'Routes': ['IV/IO'],
				'Dose': '1-4g of a 10% solution 1- 2 grams for cardiac and asthma in 1-2 minutes\n4grams over 20 minutes for pregnancy\nMaintenance: 1 to 2 grams per hour ',
				'Medication_per_volume': '1gram/10ml   2grams in 20ml   4grams in 40ml'},
			{'Medication': 'EPINEPHRINE ',
				'Class': 'Sympathomimetic',
				'Indications': ['1:10','000 cardiac arrest','1:1000','bronchial asthma','anaphylaxis','allergic reactions','drip refractory bradycardia 1:100','000 push epi (shock)'],
				'Contraindications': ['Severe cardiac disease','hypertension','tachydysrhythmias'],
				'Packaging': ['Vials','ampules','prefilled syringes','premixed 1mg in 500ml'],
				'Routes': ['IV','IO','ET','SQ'],
				'Dose': '1:1,000 0.3 - 0.5mg SQ (asthma/anaphylaxis)\n1:10,000 1mg IV/IO (cardiac arrest)every 3-5 minutes\n1000mg/1000ml 2 -10mcg/min drip (vasopressor)\nPush: 1:100,000 10mcg/ml every 2-3minutes(vasopressor)',
				'Medication_per_volume': '1:1000  1mg/1ml  1:10,000 1mg/ 10ml  1:100,000 01mg/10ml = 100mcg/10ml'},
			{'Medication': 'DEXAMETHAZONE/DECADRON',
				'Class': 'Steroid',
				'Indications': ['anaphylaxis after epinephrine and diphenhydramine','asthma','croup','COPD'],
				'Contraindications': ['none in the emergency setting, medication onset 2-6 hours so effects will likely not be seen in the emergency setting'],
				'Packaging': ['vials'],
				'Routes': ['IV/IO/IM'],
				'Dose': '4-24mg',
				'Medication_per_volume': '2mg/mL'},
			{'Medication': 'NITROGLYCERIN ',
				'Class': 'Antianginal/Vasodilator',
				'Indications': ['Angina pectoris','chest pains suspicious of cardiac','CHF with pulmonary edema  Hypertensive crisis (with caution)'],
				'Contraindications': ['Hypotension'],
				'Packaging': ['Metered dose spray – multidose'],
				'Routes': ['Sublingual '],
				'Dose': 'Chest pain -  0.4mg spray x 3 every 5 minutes titrated to B/P and pain\nCHF – titrated to B/P\n> 180 systolic =12mg (3 sprays)\n> 140 systolic = 08mg (2 sprays)\n> 90 systolic = 04mg (1 spray)',
				'Medication_per_volume': 'metered dose spray'},
		]
	},
	{
		"week": "7",
		"generic_list": [
			{'brand': 'Fosamax®', 'generic': 'Alendronate', 'function': ['Bone Resorption Osteoporosis'] },
			{'brand': 'Allegra®', 'generic': 'Fexofenadine', 'function': ['Antihistamine','Allergies'] },
			{'brand': 'Mevacor®', 'generic': 'Lovastatin', 'function': ['Statin/Cholesterol'] },
			{'brand': 'Catapres®', 'generic': 'Clonidine', 'function': ['Alpha Receptor Agonist','HTN'] },
			{'brand': 'Phenergan®', 'generic': 'Promethazine', 'function': ['Antiemetic','Nausea'] },
			{'brand': 'Yaz®', 'generic': 'Ethinyl estradiol + Drospirenone', 'function': ['Birth Control'] },
			{'brand': 'Viagra®', 'generic': 'Sildenafil', 'function': ['Erectile Dysfunction'] },
			{'brand': 'Celebrex®', 'generic': 'Celecoxib', 'function': ['N.S.A.I.D.','Arthritis'] },
			{'brand': 'Vibramycin®', 'generic': 'Doxycycline', 'function': ['Antibiotic'] }
		],
		"paramedic_list": [
			{'Medication': 'NITROPASTE',
				'Class': 'Antianginal/Vasodilator',
				'Indications': ['Angina pectoris','chest pain suspicious of cardiac','CHF with pulmonary edema'],
				'Contraindications': ['Contraindication: Hypersensitivity','hypotension','head injury','cerebral hemorrhage '],
				'Packaging': ['Multidose tube or individual 1inch packs'],
				'Routes': ['1inch of paste for diastolic B/P above 100  Spread over a 2-4 inch hairless space and covered with tape '],
				'Dose': '15mg',
				'Medication_per_volume': '1 inch = 15mg'},
			{'Medication': 'ASPIRIN',
				'Class': 'Platelet Inhibitor and Anti-Inflammatory',
				'Indications': ['Chest pains'],
				'Contraindications': ['Hypersensitivity'],
				'Packaging': ['Pills in individual packages','pills in multidose container'],
				'Routes': ['Oral'],
				'Dose': 'Four 81mg chewable tablets = 324mg total',
				'Medication_per_volume': 'n/a'},
			{'Medication': 'LIDOCAINE/XYLOCAINE',
				'Class': 'Antidysrhythmic',
				'Indications': ['Malignant PVCs','ventricular tachycardia ventricular fibrillation Pain associated with IO infusion'],
				'Contraindications': ['Heart blocks','PVCs in conjunction with bradycardia'],
				'Packaging': ['Prefilled syringe','premixed bags'],
				'Routes': ['Route(s) medication is able to be administered? IV bolus','IV drip infusion','IO','ET'],
				'Dose': 'Initial bolus of 1.0-1.5mg/Kg, repeat up to 3mg/Kg\nPost resuscitation maintainance 2-4mg/min infusion\nIO pain 20-40mg IO push',
				'Medication_per_volume': '100mg in 5ml(20mg/ml) or 2g in 500ml (4mg/ml)'},
			{'Medication': 'ATROPINE',
				'Class': 'Parasympatholytic (anticholinergic)',
				'Indications': ['Hemodynamically significant bradycardia','organophosphate poisoning May consider with Bradycardic AV blocks if pacing is delayed'],
				'Contraindications': ['None in emergent situations'],
				'Packaging': ['Prefilled syringes','multidose vials'],
				'Routes': ['IV/IO','ET','IM','autoinjector'],
				'Dose': 'Sinus Bradycardia 1 mg every 3-5 min to a max dose of 0.04mg/kg\nOrganophosphate poisoning 2-5mg every 5 mins until symptoms resolved',
				'Medication_per_volume': '1mg in 10ml '},
		]
	},
	{
		"week": "8",
		"generic_list": [
			{'brand': 'Klor-Con®', 'generic': 'Potassium Chloride', 'function': ['Electrolyte'] },
			{'brand': 'Elavil®', 'generic': 'Amitriptyline', 'function': ['Antidepressant','Tricyclic'] },
			{'brand': 'Prevacid®', 'generic': 'Lansoprazole', 'function': ['Proton Pump Inhibitor','GERD/reflux'] },
			{'brand': 'Actos®', 'generic': 'Pioglitazone', 'function': ['Antidiabetic'] },
			{'brand': 'Medrol®', 'generic': 'Methyl-prednisolone', 'function': ['Steroid Anti-Inflammatory'] },
			{'brand': 'Zyloprim®', 'generic': 'Allopurinol', 'function': ['Antigout'] },
			{'brand': 'Tylenol 3®', 'generic': 'Codeine + APAP', 'function': ['Pain Relief','Narcotic','DEA Sch 3'] },
			{'brand': 'Vasotec®', 'generic': 'Enalapril', 'function': ['ACE Inhibitor','HTN'] },
			{'brand': 'Soma®', 'generic': 'Carisoprodol', 'function': ['Muscle Relaxant','DEA Sch 4'] }
		],
		"paramedic_list": [
			{'Medication': 'FUROSEMIDE/LASIX',
				'Class': 'Loop diuretic',
				'Indications': ['Congestive heart failure','pulmonary edema'],
				'Contraindications': ['Pregnancy','dehydration'],
				'Packaging': ['Vials','preload syringes'],
				'Routes': ['IV/IO'],
				'Dose': '40mg – 100mg (double patient’s home dose up to 100mg)',
				'Medication_per_volume': '100mg in 10ml   10mg/ml'},
			{'Medication': 'ADENOSINE/ADENOCARD',
				'Class': 'Antidysrhythmic',
				'Indications': ['Symptomatic PSVT','SVT'],
				'Contraindications': ['Second or third degree AV blocks','hypersensitivity','sick-sinus syndrome'],
				'Packaging': ['Vials and preloads'],
				'Routes': ['Rapid IV push with flush','IO'],
				'Dose': '6mg, if unresolved repeat 12mg',
				'Medication_per_volume': '6mg in 2 ml    3mg/ml'},
			{'Medication': 'AMIODARONE/CORDARONE',
				'Class': 'Antidysrhythmic',
				'Indications': ['Ventricular tachycardia','ventricular fibrillation','SVT refractory to Adenosine  Rapid A-fib NCEMS only unstable rapid A-fib post cardioversion'],
				'Contraindications': ['AV blocks','sinus bradycardia'],
				'Packaging': ['Vials','preloads','drips '],
				'Routes': ['IV/IO '],
				'Dose': 'Pulse 150mg over 10 minutes\nno pulse 300mg IVP, may repeat once after 3-5 minutes 150mg IVP\nPost resuscitation maintainance 1mg/min for up to 6 hours',
				'Medication_per_volume': '150mg in 3ml    50mg/ml'},
			{'Medication': 'SODIUM BICARBONATE',
				'Class': 'Alkalinizing agent',
				'Indications': ['Suspected acidosis with late cardiac arrest management','tricyclic overdose','aspirin overdose','phenobarbital overdose','severe crush injuries','known hyperkalemia'],
				'Contraindications': ['Alkalotic state'],
				'Packaging': ['Prefilled syringe'],
				'Routes': ['IV/IO'],
				'Dose': '1mEq/Kg',
				'Medication_per_volume': '50mEq in 50ml  1mEq/ml'}
		]
	},
	{
		"week": "9",
		"generic_list": [
			{'brand': 'Flomax®', 'generic': 'Tamsulosin', 'function': ['Prostate ','Urinary Retention'] },
			{'brand': 'Proventil®', 'generic': 'Albuterol', 'function': ['Beta 2 Agonist','Bronchodilator'] },
			{'brand': 'Oxycontin®', 'generic': 'Oxycodone', 'function': ['Pain Relief','Narcotic','DEA Sch 2'] },
			{'brand': 'Lantus®', 'generic': 'Insulin Glargine', 'function': ['Type I diabetes'] },
			{'brand': 'Nasonex®', 'generic': 'Mometasone', 'function': ['Corticosteroid','Allergies'] },
			{'brand': 'Lyrica®', 'generic': 'Pregabalin', 'function': ['Anticonvulsant','Nerve Pain','Fibromyalgia','DEA Sch 2'] },
			{'brand': 'Amaryl®', 'generic': 'Glimepiride', 'function': ['Antidiabetic'] },
			{'brand': 'Restoril®', 'generic': 'Temazepam', 'function': ['Sleep Aid','DEA Sch 4'] },
			{'brand': 'Folvite®', 'generic': 'Folic Acid', 'function': ['Mineral Supplement'] }
		],
		"paramedic_list": [
			{'Medication': 'CALCIUM CHLORIDE',
				'Class': 'Electrolyte',
				'Indications': ['Acute hyperkalemia','acute hypocalcemia','calcium channel blocker overdose','antidote for magnesium sulfate Cardiac Arrest with dialysis patient'],
				'Contraindications': ['Patients receiving digitalis','hypercalcemia'],
				'Packaging': ['Prefilled syringes'],
				'Routes': ['IV/IO'],
				'Dose': '500mg – 1gram ',
				'Medication_per_volume': '1gram in 10ml   100mg/ml'},
			{'Medication': 'NOREPINEPHRINE/LEVOPHED',
				'Class': 'Sympathomimetic, vasopressor',
				'Indications': ['Cardiogenic shock','neurogenic shock','hemodynamically significant hypotension refractory to other sympathomimetics'],
				'Contraindications': ['Hypotension due to hypovolemia'],
				'Packaging': ['4mg vials  Mix in 250ml D5W for a 4mg in 250ml = 4000mcg in 250ml = 16mcg/ml'],
				'Routes': ['IV/IO drip'],
				'Dose': '2 – 20mcg/min IV, titrated to effect  Start with 2mcg/min',
				'Medication_per_volume': '16mcg per ml'},
			{'Medication': 'DEXTROSE (50%)D50,(25%)D25,(10%)D10',
				'Class': 'Carbohydrate',
				'Indications': ['Hypoglycemia'],
				'Contraindications': ['None in the emergency setting'],
				'Packaging': ['Prefilled syringes  Drips  May need to make a drip'],
				'Routes': ['IV/IO'],
				'Dose': '12.5 to 25gm',
				'Medication_per_volume': 'D50 25gm in 50ml,D25 25gm in 100ml,D10 25gm in 250ml'},
			{'Medication': 'ORAL GLUCOSE',
				'Class': 'Carbohydrate',
				'Indications': ['Conscious hypoglycemic patient'],
				'Contraindications': ['Unconscious','inability to swallow or control airway'],
				'Packaging': ['Preloaded oral tube'],
				'Routes': ['Oral'],
				'Dose': '15grams',
				'Medication_per_volume': '15grams per tube'}
		]
	},
	{
		"week": "10",
		"generic_list": [
			{'brand': 'Premarin®', 'generic': 'Conjugated Estrogen', 'function': ['Estrogen Replacement'] },
			{'brand': 'Zetia®', 'generic': 'Ezetimibe', 'function': ['Cholesterol'] },
			{'brand': 'Aldactone®', 'generic': 'Spironolactone', 'function': ['Diuretic','HTN'] },
			{'brand': 'Vytorin®', 'generic': 'Ezetimibe + Simvastatin', 'function': ['Statin/Cholesterol'] },
			{'brand': 'Seroquel®', 'generic': 'Quetiapine', 'function': ['Antipsychotic'] },
			{'brand': 'Levaquin®', 'generic': 'Levofloxacin', 'function': ['Antibiotic'] },
			{'brand': 'Tricor®', 'generic': 'Fenofibrate', 'function': ['Cholesterol'] },
			{'brand': 'Spiriva®', 'generic': 'Tiotropium', 'function': ['Anticholinergic','Bronchodilator'] },
			{'brand': 'Lotensin®', 'generic': 'Benazepril', 'function': ['ACE Inhibitor','HTN'] }
		],
		"paramedic_list": [
			{'Medication': 'GLUCAGON',
				'Class': 'Hormone',
				'Indications': ['Hypoglycemia','Beta Blocker Overdose'],
				'Contraindications': ['Hypersensitivity'],
				'Packaging': ['Powder with sterile water reconstitution solution'],
				'Routes': ['IM'],
				'Dose': '1 unit',
				'Medication_per_volume': '1 unit in 1ml'},
			{'Medication': 'DIPHENHYDRAMINE/BENADRYL',
				'Class': 'Antihistamine',
				'Indications': ['Anaphylaxis','allergic reactions','dystonic reaction due to phenothiazines (extrapyramital reaction)','nausea with vomiting'],
				'Contraindications': ['Asthma','known hypersensitivity'],
				'Packaging': ['OTC','vials'],
				'Routes': ['Slow IV push','IM'],
				'Dose': '25 – 50mg',
				'Medication_per_volume': '50mg in 1ml'},
			{'Medication': 'NARCAN/NALOXONE',
				'Class': 'Narcotic Antagonist',
				'Indications': ['Known narcotic overdose','ALOC with hypoventilation'],
				'Contraindications': ['Hypersensitivity'],
				'Packaging': ['Prefilled syringes','vials','ampules'],
				'Routes': ['IV/IO','IM','IN','ET'],
				'Dose': '0.4mg to 2mg   ET dose 4mg',
				'Medication_per_volume': '1mg/ml or 04mg/ml dependent on packaging'},
			{'Medication': 'ACTIVATED CHARCOAL',
				'Class': 'Adsorbent',
				'Indications': ['Poisoning'],
				'Contraindications': ['None in severe poisoning – caution with airway and aspiration'],
				'Packaging': ['Large bottle with or without Sorbital'],
				'Routes': ['PO','NG or OG tube'],
				'Dose': '1g/kg – commonly in a 50g mixture',
				'Medication_per_volume': '50grams in 240ml '}
		]
	},
	{
		"week": "11",
		"generic_list": [
			{'brand': 'Lamictal®', 'generic': 'Lamotrigine', 'function': ['Anticonvulsant'] },
			{'brand': 'Benicar HCT®', 'generic': 'Olmesartan + HCTZ', 'function': ['Angiotensin II Receptor Blocker','Diuretic','HTN'] },
			{'brand': 'Aricept®', 'generic': 'Donepezil', 'function': ['Cholinesterase Inhibitor','Alzheimer’s'] },
			{'brand': 'Risperdal®', 'generic': 'Risperidone', 'function': ['Antipsychotic'] },
			{'brand': 'Glucotrol®', 'generic': 'Glipizide', 'function': ['Antidiabetic'] },
			{'brand': 'Adderall®', 'generic': 'Amphetamine + Dextro – Amphetamine', 'function': ['Stimulant ADHD','DEA Sch 2'] },
			{'brand': 'Abilify®', 'generic': 'Aripiprazole', 'function': ['Antipsychotic'] },
			{'brand': 'Lanoxin®', 'generic': 'Digoxin', 'function': ['Inotrope','Atrial Fibrillation'] },
			{'brand': 'Imdur®', 'generic': 'Isosorbide Mononitrate', 'function': ['Vasodilator','Nitrate'] }
		],
		"paramedic_list": [
			{'Medication': 'LORAZEPAM/ATIVAN',
				'Class': 'Tranquilizer (benzodiazepine)',
				'Indications': ['Seizures','status seizures','premedication before cardioversion','acute anxiety'],
				'Contraindications': ['Hypersensitivity  '],
				'Packaging': ['Vials','carpuject/bristojet and ampules'],
				'Routes': ['IV/IO','IM and rectal'],
				'Dose': '0.5mg – 2.0mg ',
				'Medication_per_volume': '2mg/ml in 1ml vials '},
			{'Medication': 'HALDOL/HALOPERIDOL',
				'Class': 'Major tranquilizer',
				'Indications': ['Acute psychotic episodes'],
				'Contraindications': ['Not to be used in the presence of other sedatives'],
				'Packaging': ['vials'],
				'Routes': ['IM'],
				'Dose': '2-5mg',
				'Medication_per_volume': '5mg/ml'},
			{'Medication': 'OXYTOCIN/PITOCIN',
				'Class': 'Hormone',
				'Indications': ['Uterine contractions','postpartum vaginal bleeding'],
				'Contraindications': ['Any condition other than postpartum bleeding','confirm baby/babies and placenta are delivered'],
				'Packaging': ['10 unit vials'],
				'Routes': ['IM','IV mixed in saline for infusion'],
				'Dose': 'IM 3-10units, IV 10 – 20 units in 1000ml NS titrated to effect',
				'Medication_per_volume': '10units/1ml'},
			{'Medication': 'ORAL LIQUID TYLENOL',
				'Class': 'Analgesic and Antipyretic',
				'Indications': ['For fevers > 1002 to prevent increase of fever  Post febrile seizure in patient is alert enough  Minor pain relief'],
				'Contraindications': ['Altered mental status','aspiration risk','hepatic or liver disease'],
				'Packaging': ['Oral suspention','bottles '],
				'Routes': ['Oral','use a disposable syringe (without needle) to inject medication into pediatrics cheek  '],
				'Dose': '15mg/kg  Not to exceed one time dose of 650mg ',
				'Medication_per_volume': 'Varies by brand'}
		]
	},
	{
		"week": "12",
		"generic_list": [
			{'brand': 'Omnicef®', 'generic': 'Cefdinir', 'function': ['Antibiotic'] },
			{'brand': 'Altace®', 'generic': 'Ramipril', 'function': ['ACE Inhibitor','HTN'] },
			{'brand': 'Nasacort®', 'generic': 'Triamcinolone', 'function': ['Inhaled Steroid','Allergies'] },
			{'brand': 'Ventolin®', 'generic': 'Albuterol', 'function': ['Bronchodilator'] },
			{'brand': 'Cozaar®', 'generic': 'Losartan', 'function': ['Angiotensin II Receptor Blocker','HTN'] },
			{'brand': 'Concerta®', 'generic': 'Methyl -phenidate', 'function': ['ADHD','DEA Sch 2'] },
			{'brand': 'DiaBeta®', 'generic': 'Glyburide', 'function': ['Antidiabetic'] },
			{'brand': 'Valtrex®', 'generic': 'Valacyclovir', 'function': ['Antiviral'] },
			{'brand': 'Tamiflu®', 'generic': 'Oseltamivir', 'function': ['Antiviral (Flu)'] }
		],
		"paramedic_list": [
			{'Medication': 'POTASSIUM CHLORIDE (KCl)',
				'Class': 'Electrolyte',
				'Indications': ['Treatment of potassium deficiency during an interfacility transfer'],
				'Contraindications': ['Renal failure','hyperkalemia'],
				'Packaging': ['Maximum of 20mEq/l of IV solution'],
				'Routes': ['IV infusion'],
				'Dose': 'Rate not to exceed 10mEq/hour',
				'Medication_per_volume': 'Dose and fluid dependent'},
			{'Medication': 'NITROGLYCERIN INFUSION',
				'Class': 'Antianginal, vasodilator, smooth muscle relaxant',
				'Indications': ['Angina pectoris','chest pains','myocardial infarction'],
				'Contraindications': ['Hypersensitivity','hypotension'],
				'Packaging': ['Glass bottle 50mg/250ml'],
				'Routes': ['IV/IO infusion'],
				'Dose': '10 mcg/min may increase by 5mcg every 3-5 minutes watching for hypotension  Not to exceed 100mcg/min',
				'Medication_per_volume': '50mg/250ml = 50000mcg/250ml = 200mcg/ml'},
			{'Medication': 'HEPARIN INFUSION',
				'Class': 'Anticoagulant',
				'Indications': ['Unstable angina','myocardial infarction','pulmonary embolism','DVT'],
				'Contraindications': ['Hypersensitivity to heparin or pork products','active or major bleeding'],
				'Packaging': ['IV bag usually 25','000 units in 500mL D5W'],
				'Routes': ['IV/IO infusion'],
				'Dose': '5000 units IV followed by 50 units/Kg maintenance infusion',
				'Medication_per_volume': '25,000 units in 500ml D5W = 50 units/ml'},
			{'Medication': 'BLOOD PRODUCTS (for transfers)',
				'Class': 'not a medication, live human tissue',
				'Indications': ['acute blood loss','severe anemia','acute sickle cell crisis','proper patient identification and blood type confirmation is essential prior to taking over patient care'],
				'Contraindications': ['Continuous Monitoring needed for possible transfusion reactions including hemolytic reactions','allergic reactions including anaphylaxis and fluid overload  '],
				'Packaging': ['Pint of blood'],
				'Routes': ['IV/IO with infuser/warmer '],
				'Dose': '2-3mL/min initially, then rate dependent on physician order',
				'Medication_per_volume': 'n/a'}
		]
	},
	{
		"week": "13",
		"generic_list": [
			{'brand': 'Pen-VK®', 'generic': 'Penicillin vk', 'function': ['Antibiotic'] },
			{'brand': 'Lunesta®', 'generic': 'Eszopiclone', 'function': ['Sleep Aid','DEA Sch 4'] },
			{'brand': 'Verelan®', 'generic': 'Verapamil', 'function': ['Calcium Channel Blocker'] },
			{'brand': 'Cleocin®', 'generic': 'Clindamycin', 'function': ['Antibiotic'] },
			{'brand': 'Flagyl®', 'generic': 'Metronidazole', 'function': ['Antibiotic'] },
			{'brand': 'Ortho Tricyclen®', 'generic': 'Ethinyl Estradiol + Norgestimateestradiol + Drospirenone', 'function': ['Birth Control'] },
			{'brand': 'Cialis®', 'generic': 'Tadalafil', 'function': ['Erectile Dysfunction'] },
			{'brand': 'Adipex®', 'generic': 'Phentermine', 'function': ['Appetite Suppressant','DEA Sch 4'] },
			{'brand': 'Levoxyl®', 'generic': 'Levothyroxine', 'function': ['Hormone'] },
			{'brand': 'Vistaril®', 'generic': 'Hydroxyzine', 'function': ['Antihistamine'] },
			{'brand': 'Cataflam®', 'generic': 'Diclofenac', 'function': ['N.S.A.I.D.'] },
			{'brand': 'Reglan®', 'generic': 'Metoclopramide', 'function': ['GI Motility Stimulant','Nausea'] },
			{'brand': 'Lopid®', 'generic': 'Gemfibrozil', 'function': ['Cholesterol'] },
			{'brand': 'Cardizem®', 'generic': 'Diltiazem', 'function': ['Calcium Channel Blocker'] }
		],
		"paramedic_list": [
			{'Medication': 'PRALIDOXIME (MARK I KITS)',
				'Class': 'Cholinesterase reactivator',
				'Indications': ['Antidote for severe organophosphate poisoning'],
				'Contraindications': ['Poisonings other than organophosphates'],
				'Packaging': ['Autoinjector for EMS'],
				'Routes': ['IM Autoinjector'],
				'Dose': '1 to 2 grams ',
				'Medication_per_volume': 'Autoinjector 300mg/mL in 2mL injection (600mg)'},
			{'Medication': 'CYANIDE KIT ',
				'Class': 'amyl nitrite – inhalant- vasodilator, sodium nitrite – inorganic compound, sodium thiosulfate – inorganic compound ',
				'Indications': ['cyanide poisoning (bitter almond smell to breath)'],
				'Contraindications': ['none in the management of cyanide poisoning'],
				'Packaging': ['kit with inhalant and vials'],
				'Routes': ['Amyl nitrite - crush 0.3mL ampul of amy nitrite and inhale','Sodium nitrite - 300mg over 5 minutes - IV','Sodium thiosulfate -12.5g over 10 minutes - IV'],
				'Dose': '',
				'Medication_per_volume': ''},
		]
	},
	{
		"week": "14",
		"generic_list": [
			{'brand': 'Depakote®', 'generic': 'Divalproex', 'function': ['Anticonvulsant'] },
			{'brand': 'Niaspan®', 'generic': 'Niacin', 'function': ['Cholesterol'] },
			{'brand': 'Inderal®', 'generic': 'Propranolol', 'function': ['Beta Blocker','HTN'] },
			{'brand': 'Hyzaar®', 'generic': 'Losartan + HCTZ', 'function': ['Angiotension II Receptor Blocker', 'Diuretic','HTN'] },
			{'brand': 'Suboxone®', 'generic': 'Buprenorphine', 'function': ['Opioid Recovery','DEA Sch 3'] },
			{'brand': 'Budeprion®', 'generic': 'Bupropion', 'function': ['Antidepressant'] },
			{'brand': 'Robitussin®', 'generic': 'Guaifenesin', 'function': ['Cold Syrup','Chest congestion'] },
			{'brand': 'Topamax®', 'generic': 'Topiramate', 'function': ['Anticonvulsant'] },
			{'brand': 'BuSpar®', 'generic': 'Buspirone', 'function': ['Anxiolytic/hypnotic'] },
			{'brand': 'Anti-Vert®', 'generic': 'Meclizine', 'function': ['Antivertigo'] },
			{'brand': 'Detrol®', 'generic': 'Tolterodine', 'function': ['Antispasmotic','UTI'] },
			{'brand': 'Vyvanse®', 'generic': 'Lisdexamfeta-', 'function': ['ADHD','DEA Sch 2'] },
			{'brand': 'Accupril®', 'generic': 'Quinapril', 'function': ['ACE Inhibitor','HTN'] },
			{'brand': 'Aciphex®', 'generic': 'Rabeprazole', 'function': ['Proton Pump Inhibitor','GERD/reflux'] },
			{'brand': 'Furadantin®', 'generic': 'Nitrofurantoin', 'function': ['Antibiotic'] }
		],
		"paramedic_list": [
			{'Medication': 'ALBUTEROL/PROVENTIL',
				'Class': 'Sympathomimic – beta 2 specific – bronchodilator',
				'Indications': ['Asthma','bronchospasm associated to COPD','irritation','allergic reaction'],
				'Contraindications': ['Hypersensitivity','symptomatic tachycardia'],
				'Packaging': ['Multi-dose vials','preload plastic vials'],
				'Routes': ['Small volume nebulizer – or nebulized and “bagged in”'],
				'Dose': '2.5mg',
				'Medication_per_volume': '25mg in 3ml'},
			{'Medication': 'IPRATROPIUM/ATROVENT',
				'Class': 'Anticholinergic',
				'Indications': ['Bronchial asthma','bronchospasm associated with chronic bronchitis and emphysema'],
				'Contraindications': ['Hypersensitivity','not to be used as solo acute respiratory bronchodilator  '],
				'Packaging': ['Preload plastic vials'],
				'Routes': ['Small volume nebulizer'],
				'Dose': '500mcg or 0.5mg',
				'Medication_per_volume': '05mg/2ml'},
			{'Medication': 'EPINEPHRINE ',
				'Class': 'Sympathomimetic',
				'Indications': ['1:10','000 cardiac arrest','1:1000','bronchial asthma','anaphylaxis','allergic reactions','drip refractory bradycardia 1:100','000 push epi (shock)'],
				'Contraindications': ['Severe cardiac disease','hypertension','tachydysrhythmias'],
				'Packaging': ['Vials','ampules','prefilled syringes','premixed 1mg in 500ml'],
				'Routes': ['IV','IO','ET','SQ'],
				'Dose': '1:1,000 0.3 - 0.5mg SQ (asthma/anaphylaxis)\n1:10,000 1mg IV/IO (cardiac arrest)every 3-5 minutes\n1000mg/1000ml 2 -10mcg/min drip (vasopressor)\nPush: 1:100,000 10mcg/ml every 2-3minutes(vasopressor)',
				'Medication_per_volume': '1:1000  1mg/1ml  1:10,000 1mg/ 10ml  1:100,000 01mg/10ml = 100mcg/10ml'},
			{'Medication': 'DIPHENHYDRAMINE/BENADRYL',
				'Class': 'Antihistamine',
				'Indications': ['Anaphylaxis','allergic reactions','dystonic reaction due to phenothiazines (extrapyramital reaction)','nausea with vomiting'],
				'Contraindications': ['Asthma','known hypersensitivity'],
				'Packaging': ['OTC','vials'],
				'Routes': ['Slow IV push','IM'],
				'Dose': '25 – 50mg',
				'Medication_per_volume': '50mg in 1ml'}
		]
	}
]

var function_list = []
var class_list = []
var indication_list = []
var contraindication_list = []
var route_list = []
var dose_list = []

func _ready():
	for i in meds:
		for j in i.generic_list:
			for l in j.function:
				var function_repeated = false
				for m in function_list:
					if m == l:
						function_repeated = true
				if not function_repeated:
					function_list.append(l)
		if i.week.to_int() < 14:
			for k in i.paramedic_list:
				var class_repeated = false
				for m in class_list:
					if k.Class == m:
						class_repeated = true
				if not class_repeated:
					class_list.append(k.Class)
				for l in k.Indications:
					var indication_repeated = false
					for m in indication_list:
						if m == l:
							indication_repeated = true
					if not indication_repeated:
						indication_list.append(l)
				for l in k.Contraindications:
					var contraindication_repeated = false
					for m in contraindication_list:
						if m == l:
							contraindication_repeated = true
					if not contraindication_repeated:
						contraindication_list.append(l)
				for l in k.Routes:
					var route_repeated = false
					for m in route_list:
						if m == l:
							route_repeated = true
					if not route_repeated:
						route_list.append(l)
				var dose_repeated = false
				for m in dose_list:
					if k.Dose == m:
						dose_repeated = true
				if not dose_repeated:
					dose_list.append(k.Dose)
	#print(function_list)
	#print(class_list)
	#print(indication_list)
	#print(contraindication_list)
	#print(route_list)
	#print(dose_list)
