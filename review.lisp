;;;; review.lisp
;;;
;;; Conducts reviews. I'm trying to pick how to store a these data.
;;; Each element of a review has the following properties (most can be nil)
;;; `HEADER': This is the header for the section and should be formatted as such.
;;; `PROMPT': This is the text shown to prompt the user to respond.
;;; `RESPONSES': This is a list of possible responses, their key binding, and the function to call when the user selects them
;;; *SHOULD I REPLACE THE FOLLOWING WITH A MACRO THAT GENERATES A `REVIEW' ITEM FOR EACH PROJECT?*
;;; `FUNCTION': This is a function to call to generate the response.

;; TODO Restructure this so it adds projects AND Tasks
(in-package #:projectwarrior)

(defmacro make-review (review-prompts &key projectsp tasksp projects-context tasks-context)
  "Generates the reviews below from a shorter format that should be easier for non-lispers"
  )

(defun clear-inboxes ()
  "This function reminds the user to clear their inboxes."
  (write-line "Take each of your inboxes and process all messages into your system.")
  (write-line "There should be no messages left. Each message should be archived in your system and each action entered into taskwarrior.")
  (add-until-enter "+in"))

(defun professional-commitments ()
  (write-line "What commitments and promises have you made to...")
  (terpri)
  (write-line "Boss/partners")
  (write-line "Colleagues")
  (write-line "Subordinates")
  (write-line "Others in the organization")
  (write-line "'Outside' people")
  (write-line "Customers")
  (write-line "Other organizations")
  (write-line "Professionals")
  (write-line "Vendors")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun professional-communications ()
  (write-line "What communications do you need to initiate or respond to?")
  (write-line "Phone calls?")
  (write-line "Voice mails?")
  (write-line "Emails?")
  (write-line "Text messages?")
  (write-line "Letters?")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun professional-social-media ()
  (write-line "What do you need to do on your professional Social Media?")
  (write-line "Posts?")
  (write-line "Replies?")
  (write-line "New accounts?")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun professional-deliverables ()
  (write-line "What deliverables do you need to produce?")
  (write-line "Reports")
  (write-line "Evaluations/reviews")
  (write-line "Proposals")
  (write-line "Articles")
  (write-line "Marketing Materials")
  (write-line "Manuals/Instructions")
  (write-line "Summaries")
  (write-line "Rewrites and edits")
  (write-line "Status reports")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun professional-class-planning ()
  (write-line "What do you need to plan for your classes?")
  (write-line "What Unit plans do you need to write?")
  (write-line "What Lesson plans do you need to write?")
  (write-line "What tests or quizzes do you need to write?")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun professional-meetings ()
  (write-line "What meetings or information sharing do you need to review?")
  (write-line "What meetings need to be set or requested?")
  (write-line "What meetings do you have upcoming?")
  (write-line "What meetings need to be debriefed?")
  (write-line "What decisions have been made that need to be passed on to stakeholders?")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun professional-read-and-reviews ()
  (write-line "What professional documents or websites do you need to read and review?")
  (add-projects-until-enter)
  (add-until-enter "+@deepthinking"))

(defun professional-finances ()
  (write-line "What professional financial tasks do you need to deal with?")
  (write-line "Cash")
  (write-line "Budgets")
  (write-line "Forecasts/projections")
  (write-line "Profit and Loss")
  (write-line "Balance Sheet")
  (write-line "Forecasting")
  (write-line "Credit Line")
  (write-line "Banks")
  (write-line "Receivables")
  (write-line "Payables")
  (write-line "Petty Cash")
  (write-line "Investors")
  (write-line "Asset Management")
  (add-projects-until-enter)
  (add-until-enter "+@admin"))

(defun professional-planning-and-organization ()
  (write-line "What planning and organization needs to be done in your professional life?")
  (write-line "Formal Planning (Goals, Targets, Objectives)")
  (write-line "Current Projects (Next stages)")
  (write-line "Business Plans")
  (write-line "Marketing Plans")
  (write-line "Financial Plans")
  (write-line "Organizational Initiatives")
  (write-line "Upcoming Events")
  (write-line "Scheduled Meetings")
  (write-line "Presentations")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun professional-conferences ()
  (write-line "What conferences are you planning and what needs to be done for them?")
  (write-line "Organizational Structuring")
  (write-line "Changes in Facilities")
  (write-line "Installation of new systems/equipment")
  (write-line "Travel")
  (write-line "Vacation")
  (write-line "Business Trips")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun professional-organizational-development ()
  (write-line "What organizational development plans are you working on right now?")
  (write-line "Org Chart Changes")
  (write-line "Restructuring")
  (write-line "Roles")
  (write-line "Job Descriptions")
  (write-line "Facilities")
  (write-line "New Systems")
  (write-line "Leadership")
  (write-line "Change Initiatives")
  (write-line "Succession Planning")
  (write-line "Organizational Culture")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun professional-marketing-promotions ()
  (write-line "What marketing and promotional projects are you working on right now?")
  (write-line "Campaigns")
  (write-line "Materials")
  (write-line "Public Relations")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun professional-administration ()
  (write-line "What professional administrative tasks do you need to take on?")
  (write-line "Legal")
  (write-line "Insurance")
  (write-line "Personnel")
  (write-line "Staffing")
  (write-line "Policies/Procedures")
  (write-line "Training")
  (add-projects-until-enter)
  (add-until-enter "+@admin"))

(defun professional-staffing ()
  (write-line "What staffing and HR tasks do you need to do?")
  (write-line "Hiring/Firing/Promoting")
  (write-line "Reviews")
  (write-line "Communications")
  (write-line "Staff Development")
  (write-line "Compensation")
  (write-line "Feedback")
  (write-line "Morale")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun professional-sales ()
  (write-line "What sales tasks do you need to do?")
  (write-line "Customers")
  (write-line "Prospects")
  (write-line "Leads")
  (write-line "Sales Process")
  (write-line "Training")
  (write-line "Relationship Building")
  (write-line "Reporting")
  (write-line "Customer Service")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun professional-systems ()
  (write-line "What systems need to be reviewed, revised, updated, and purchased?")
  (write-line "Mobile Devices")
  (write-line "Phones")
  (write-line "Computers")
  (write-line "Software")
  (write-line "Database")
  (write-line "Telecom")
  (write-line "Internet")
  (write-line "Filing and reference")
  (write-line "Inventories")
  (write-line "Storage")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun professional-office-site-locations ()
  (write-line "What needs to be done in your physical workspaces?")
  (write-line "Space and arrangements")
  (write-line "Furniture")
  (write-line "Equipment")
  (write-line "Decorations")
  (write-line "Utilities")
  (write-line "Supplies")
  (write-line "Maintenance and Cleaning")
  (write-line "Security")
  (add-projects-until-enter)
  (add-until-enter "+@school"))

(defun professional-development ()
  (write-line "What professional development do you need to do?")
  (write-line "Trainings and seminars")
  (write-line "Things to learn")
  (write-line "Things to find out")
  (write-line "Skills to practice/develop")
  (write-line "Books to read/study")
  (write-line "Research")
  (write-line "Formal Education (licensing and degrees)")
  (write-line "Career Research")
  (write-line "Research and Development")
  (write-line "Performance Objectives")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun professional-wardrobe ()
  (write-line "What do you need to do about your Professional Wardrobe?")
  (write-line "New items?")
  (write-line "Repairs?")
  (write-line "Cleaning and maintenance")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun professional-waiting-fors ()
  (write-line "What are you waiting for professionally?")
  (write-line "What information do you need?")
  (write-line "What tasks have you delegated?")
  (write-line "What critical path tasks are blocking current projects?")
  (write-line "What questions need answered?")
  (write-line "What emails need replied to?")
  (write-line "What letters need replied to?")
  (write-line "What proposal submissions are you waiting to hear back on?")
  (write-line "What call backs do you need to make?")
  (write-line "What RSVPs do you need to reply to?")
  (write-line "What RSVPs are you waiting to hear back on?")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun professional-requisitions-and-reimbursements ()
  (write-line "What professional requisitions do you need to make and what are you waiting to get reimbursed on?")
  (write-line "Insurance Claims")
  (write-line "Ordered items")
  (write-line "Repairs")
  (write-line "Tickets")
  (write-line "Decisions from others")
  (write-line "PD Reimbursements")
  (add-projects-until-enter)
  (add-until-enter "+@office"))

(defun professional-tickler ()
  "This function is a tickler function reminding the user of professional commitments."
  (write-line "Now review your professional life. What open loops do you have professionally?")
  (terpri)
  (terpri)
  (terpri)
  (professional-commitments)
  (professional-communications)
  (professional-social-media)
  (professional-deliverables)
  (professional-meetings)
  (professional-read-and-reviews)
  (professional-finances)
  (professional-planning-and-organization)
  (professional-conferences)
  (professional-organizational-development)
  (professional-marketing-promotions)
  (professional-administration)
  (professional-staffing)
  (professional-sales)
  (professional-systems)
  (professional-office-site-locations)
  (professional-development)
  (professional-wardrobe)
  (professional-waiting-fors)
  (professional-requisitions-and-reimbursements)
  (write-line "Are there any other professional obligations you need to capture before moving to your personal life?")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun personal-organizations ()
  (write-line "What personal organizations do you have obligations to?")
  (write-line "Service Organizations")
  (write-line "Community Organizations")
  (write-line "Volunteer Organizations")
  (write-line "Spiritual Organizations")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun personal-commitments ()
  (write-line "What commitments and promises have you made others in your personal life?")
  (write-line "Your Partner or Spouse?")
  (write-line "Children?")
  (write-line "Parents?")
  (write-line "Family")
  (write-line "Friends")
  (write-line "Professionals")
  (write-line "What items do you need to return?")
  (write-line "What debts do you owe?")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun personal-communications ()
  (write-line "What communications do you need to make in your personal life?")
  (write-line "Calls")
  (write-line "Emails")
  (write-line "Cards and Letters")
  (write-line "Thank-yous")
  (write-line "Texts")
  (write-line "Social Media Posts")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun personal-events ()
  (write-line "What upcoming events do you have?")
  (write-line "Birthdays")
  (write-line "Anniversaries")
  (write-line "Weddings")
  (write-line "Graduations")
  (write-line "Receptions")
  (write-line "Outings")
  (write-line "Holidays")
  (write-line "Vacation")
  (write-line "Travel")
  (write-line "Dinners")
  (write-line "Parties")
  (write-line "Cultural Events")
  (write-line "Sporting Events")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun personal-admin ()
  (write-line "What personal Administrative tasks do you need to do?")
  (write-line "Home office supplies")
  (write-line "Equipment")
  (write-line "Phones")
  (write-line "Mobile Devices")
  (write-line "Audo/Video Media")
  (write-line "Voice Mails")
  (write-line "Computers")
  (write-line "Software")
  (write-line "Internet")
  (write-line "Filing and Records")
  (write-line "Data Storage and Backup")
  (add-projects-until-enter)
  (add-until-enter "+@admin"))

(defun personal-leisure ()
  (write-line "What hobby and leisure activites do you need to do?")
  (write-line "Books")
  (write-line "Music")
  (write-line "Travel")
  (write-line "Places to visit")
  (write-line "People to visit")
  (write-line "Web Browsing")
  (write-line "Photography")
  (write-line "Sports")
  (write-line "Hobbies")
  (write-line "Cooking")
  (write-line "Recreation")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun personal-finances ()
  (write-line "What personal finance tasks do you need to do?")
  (write-line "Bills")
  (write-line "Banks")
  (write-line "Investments")
  (write-line "Loans")
  (write-line "Taxes")
  (write-line "Budget")
  (write-line "Insurance")
  (write-line "Mortgage")
  (write-line "Bookkeeping")
  (write-line "Accountants")
  (add-projects-until-enter)
  (add-until-enter "+@admin"))

(defun personal-pets ()
  (write-line "What do you need to do for your pets?")
  (write-line "Health")
  (write-line "Training")
  (write-line "Supplies")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun personal-legal ()
  (write-line "What legal tasks do you need to do personally?")
  (write-line "Wills")
  (write-line "Trusts")
  (write-line "Estates")
  (write-line "Legal Affairs")
  (write-line "Passports and International Living")
  (add-projects-until-enter)
  (add-until-enter "+@admin"))

(defun personal-family-projects ()
  (write-line "What projects are you working on with or for your family?")
  (write-line "Partner/spouse")
  (write-line "Children")
  (write-line "Parents")
  (write-line "Relatives")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun personal-home-and-household ()
  (write-line "What do you need to do around your house?")
  (write-line "Real Estate")
  (write-line "Repairs")
  (write-line "Construction")
  (write-line "Remodeling")
  (write-line "Landlords")
  (write-line "Heating and Air Conditioning")
  (write-line "Plumbing")
  (write-line "Utilities")
  (write-line "Roof")
  (write-line "Landscaping")
  (write-line "Driveway")
  (write-line "Garage")
  (write-line "Walls")
  (write-line "Floors")
  (write-line "Ceilings")
  (write-line "Decor")
  (write-line "Furniture")
  (write-line "Appliances")
  (write-line "Lights and wiring")
  (write-line "Kitchen supplies and equipment")
  (write-line "Laundry")
  (write-line "Purging, organizing, and cleaning")
  (write-line "Storage")
  (write-line "Service Providers")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun personal-health ()
  (write-line "How do you need to take care of your body?")
  (write-line "Doctors")
  (write-line "Dentists")
  (write-line "Optometrist")
  (write-line "Healthcare Specialists")
  (write-line "Checkups")
  (write-line "Diet")
  (write-line "Exercise")
  (write-line "Food")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun personal-development ()
  (write-line "What personal development do you need to do?")
  (write-line "Classes")
  (write-line "Seminars")
  (write-line "Education")
  (write-line "Coaching/counseling")
  (write-line "Career")
  (write-line "Creative Expressions")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun personal-transportation ()
  (write-line "What projects do you need to take care of with your transportation?")
  (write-line "Motor Vehicles")
  (write-line "Bicycles")
  (write-line "Maintenance")
  (write-line "Repair")
  (write-line "Commuting")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun personal-clothing ()
  (write-line "What do you need to do with your wardrobe?")
  (write-line "Professional clothing")
  (write-line "Causal clothing")
  (write-line "Formal attire")
  (write-line "Sports")
  (write-line "Accessories")
  (write-line "Luggage")
  (write-line "Repairs")
  (write-line "Tailoring")
  (add-projects-until-enter)
  (add-until-enter "project:wardrobe"))

(defun personal-errands ()
  (write-line "What errands do you need to run personally?")
  (write-line "Shopping")
  (write-line "Stores")
  (write-line "Hardware stores")
  (write-line "Supplies")
  (write-line "Groceries")
  (write-line "Gifts")
  (write-line "Pharmacy")
  (write-line "Bank")
  (write-line "Cleaners")
  (write-line "Repairs")
  (add-projects-until-enter)
  (add-until-enter "+@errands"))

(defun personal-community ()
  (write-line "What do you need to do in your community?")
  (write-line "Neighborhood")
  (write-line "Neighbors")
  (write-line "Service")
  (write-line "Schools")
  (write-line "Civic Involvement")
  (write-line "Voting")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun personal-waiting-fors ()
  (write-line "What are you waiting for in your personal life?")
  (write-line "Product orders")
  (write-line "Repairs")
  (write-line "Reimbursements")
  (write-line "Loaned Items")
  (write-line "Information")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun personal-misc ()
  (write-line "RSVPs to make")
  (write-line "RSVPs to request")
  (write-line "Projects/tasks completed by family or friends")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun personal-tickler ()
  "This function is a tickler function reminding the user of personal commitments."
  (write-line "Now review your personal life. What open loops do you have personally?")
  (terpri)
  (personal-organizations)
  (personal-commitments)
  (personal-communications)
  (personal-events)
  (personal-admin)
  (personal-leisure)
  (personal-finances)
  (personal-pets)
  (personal-legal)
  (personal-family-projects)
  (personal-home-and-household)
  (personal-health)
  (personal-development)
  (personal-transportation)
  (personal-clothing)
  (personal-errands)
  (personal-community)
  (personal-waiting-fors)
  (personal-misc)
  (write-line "Are there any other things in your personal life that need to be captured?")
  (add-projects-until-enter)
  (add-until-enter ""))

(defun calendar-review ()
  "This function is a tickler function guiding the user through reviewing their calendar."
  (write-line "Now review your calendar. What have you done this week and what will you do next week?")
  (terpri)
  (ask-until-valid '("") "Press enter when you are finished."))

(defun someday-maybe ()
  "This function is a tickler function guiding the user through their someday maybe list."
  (write-line "Now review your Someday/Maybe list. Are there any things here where 'some day' is now? Are there things here where 'maybe' has become no?")
  (terpri)
  (ask-until-valid '("") "Press enter when you are finished."))

(defun get-creative ()
  "This function reminds the user to get creative."
  (write-line "Now get creative. Are there any new, wonderful, hare-brained, thought-provoking, risk-taking ideas to add to your system?")
  (terpri)
  (ask-until-valid '("") "Press enter when you are finished."))

(defun weekly-review ()
  "This function will guide the user through a weekly review. It does this by going through the functions in the review items list in order."
  (clear-inboxes)
  (professional-tickler)
  (personal-tickler)
  (calendar-review)
  (someday-maybe)
  (get-creative))
