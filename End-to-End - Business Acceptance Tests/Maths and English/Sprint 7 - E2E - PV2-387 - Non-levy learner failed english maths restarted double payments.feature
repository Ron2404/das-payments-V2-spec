##Background information: 
##
##Providers are paid �471 per aim. this is funded from outside the total price and is flat-profiled across the planned number of months in learning for that aim. There is no N+1, there is no money held back for completion. 
##If the learner has english and maths needs above level 2 (apprenticeship requires higher) this is funded within the total price.
##It is permissible for a Level 2 apprentice to fail level 2 English & Maths, retake the learning, but complete the programme because they have already met the policy.
#
#Scenario: Non-DAS Learner taking single Level 1 aim, progressing to and completing single Level 2 aim, completes to time 
#
#Given the apprenticeship funding band maximum is 15000
#
#When an ILR file is submitted with the following data:
#		  | ULN       | learner type                 | standard code | agreed price | start date | planned end date | actual end date | completion status | aim type         |
#		  | learner a | 19-24 programme only non-DAS | 76            | 15000        | 06/08/2018 | 08/08/2020       |                 | continuing        | programme        |
#		  | learner a | 19-24 programme only non-DAS | 76            | 471          | 06/08/2018 | 08/08/2019       | 08/08/2019      | completed         | maths or english |
#		  | learner a | 19-24 programme only non-DAS | 76            | 471          | 09/08/2019 | 08/08/2020       | 08/08/2020      | completed         | maths or english |
#		  
#	
#Then the provider earnings and payments break down as follows:
#
#		  | Type                                    | 08/18  | 09/18  | 10/18  | 11/18  | 12/18  | ... | 08/19  | 09/19  | ... | 07/20  | 08/20  |
#		  | Provider Earned Total                   | 539.25 | 539.25 | 539.25 | 539.25 | 539.25 | ... | 539.25 | 539.25 | ... | 539.25 | 0      |
#		  | Provider Paid by SFA                    | 0      | 489.25 | 489.25 | 489.25 | 489.25 | ... | 489.25 | 489.25 | ... | 489.25 | 489.25 |
#		  | Payment due from Employer               | 0      | 50     | 50     | 50     | 50     | ... | 50     | 50     | ... | 50     | 50     |
#		  | Levy account debited                    | 0      | 0      | 0      | 0      | 0      | ... | 0      | 0      | ... | 0      | 0      |
#		  | SFA Levy employer budget                | 0      | 0      | 0      | 0      | 0      | ... | 0      | 0      | ... | 0      | 0      |
#		  | SFA levy co-funding budget              | 0      | 0      | 0      | 0      | 0      | ... | 0      | 0      | ... | 0      | 0      |
#		  | SFA non-Levy co-funding budget          | 450    | 450    | 450    | 450    | 450    | ... | 450    | 450    | ... | 450    | 0      |
#		  | SFA non-Levy additional payments budget | 39.25  | 39.25  | 39.25  | 39.25  | 39.25  | ... | 39.25  | 39.25  | ... | 39.25  | 0      |
#		  | SFA levy additional payments budget     | 0      | 0      | 0      | 0      | 0      | ... | 0      | 0      | ... | 0      | 0      |
#		  
#And the transaction types for the payments are:
#		  | Payment type                   | 09/18 | 10/18 | 11/18 | 12/18 | ... | 08/19 | 09/19 | ... | 07/20 | 08/20 |
#		  | On-program                     | 450   | 450   | 450   | 450   | ... | 450   | 450   | ... | 450   | 450   |
#		  | Completion                     | 0     | 0     | 0     | 0     | ... | 0     | 0     | ... | 0     | 0     |
#		  | Balancing                      | 0     | 0     | 0     | 0     | ... | 0     | 0     | ... | 0     | 0     |
#		  | English and maths on programme | 39.25 | 39.25 | 39.25 | 39.25 | ... | 39.25 | 39.25 | ... | 39.25 | 39.25 |
#		  | English and maths Balancing    | 0     | 0     | 0     | 0     | ... | 0     | 0     | ... | 0     | 0     |  	  
	

# Notes - Multiple Maths and Eng levels and 2 years course

# New template
Feature: Non-levy learner, taking single Level 1 aim, progressing to and completing single Level 2 aim, completes to time 

Scenario Outline: Non-levy learner taking single Level 1 aim, progressing to and completing single Level 2 aim, completes to time PV2-387
	Given the following learners
        | Learner Reference Number | Uln      |
        | abc123                   | 12345678 |
	# New field - Aim Type
	And the following aims
		| Aim Type         | Aim Reference | Start Date                | Planned Duration | Actual Duration | Aim Sequence Number | Framework Code | Pathway Code | Programme Type | Funding Line Type             | Completion Status |
		| Maths or English | 12345         | 06/Aug/Last Academic Year | 12 months        |                 | 1                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | continuing        |
		| Programme        | ZPROG001      | 06/Aug/Last Academic Year | 24 months        |                 | 2                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | continuing        |
	And price details as follows	
	# Price details
        | Price Details     | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage |
        | 1st price details | 0                    | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             | Act2          | 1                   |                             |
        | 2nd price details | 9000                 | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             | Act2          | 2                   | 90%                         |
    And the following earnings had been generated for the learner
        | Delivery Period        | On-Programme | Completion | Balancing | OnProgrammeMathsAndEnglish |
        | Aug/Last Academic Year | 600          | 0          | 0         | 39.25                      |
        | Sep/Last Academic Year | 600          | 0          | 0         | 39.25                      |
        | Oct/Last Academic Year | 600          | 0          | 0         | 39.25                      |
        | Nov/Last Academic Year | 600          | 0          | 0         | 39.25                      |
        | Dec/Last Academic Year | 600          | 0          | 0         | 39.25                      |
        | Jan/Last Academic Year | 600          | 0          | 0         | 39.25                      |
        | Feb/Last Academic Year | 600          | 0          | 0         | 39.25                      |
        | Mar/Last Academic Year | 600          | 0          | 0         | 39.25                      |
        | Apr/Last Academic Year | 600          | 0          | 0         | 39.25                      |
        | May/Last Academic Year | 600          | 0          | 0         | 39.25                      |
        | Jun/Last Academic Year | 600          | 0          | 0         | 39.25                      |
        | Jul/Last Academic Year | 600          | 0          | 0         | 39.25                      |
    And the following provider payments had been generated
        | Collection Period      | Delivery Period        | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type           |
        | R01/Last Academic Year | Aug/Last Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R02/Last Academic Year | Sep/Last Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R03/Last Academic Year | Oct/Last Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R04/Last Academic Year | Nov/Last Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R05/Last Academic Year | Dec/Last Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R06/Last Academic Year | Jan/Last Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R07/Last Academic Year | Feb/Last Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R08/Last Academic Year | Mar/Last Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R09/Last Academic Year | Apr/Last Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R10/Last Academic Year | May/Last Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R11/Last Academic Year | Jun/Last Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R12/Last Academic Year | Jul/Last Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R01/Last Academic Year | Aug/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R02/Last Academic Year | Sep/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R03/Last Academic Year | Oct/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R04/Last Academic Year | Nov/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R05/Last Academic Year | Dec/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R06/Last Academic Year | Jan/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R07/Last Academic Year | Feb/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R08/Last Academic Year | Mar/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R09/Last Academic Year | Apr/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R10/Last Academic Year | May/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R11/Last Academic Year | Jun/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R12/Last Academic Year | Jul/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
	# Note - Multiple Maths and English
    But aims details are changed as follows
		| Aim Type         | Aim Reference | Start Date                   | Planned Duration | Actual Duration | Aim Sequence Number | Framework Code | Pathway Code | Programme Type | Funding Line Type             | Completion Status |
		| Maths or English | 12345         | 06/Aug/Last Academic Year    | 12 months        | 12 months       | 1                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | completed         |
		| Programme        | ZPROG001      | 06/Aug/Last Academic Year    | 24 months        |                 | 2                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | continuing        |
		| Maths or English | 67890         | 09/Aug/Current Academic Year | 12 months        |                 | 3                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | continuing        |
	# New step 
	# Note the order of Aim Sequence Number
	And price details are changed as follows		
        | Price Details     | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage |
        | 1st price details | 0                    | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             | Act2          | 1                   |                             |
        | 2nd price details | 9000                 | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             | Act2          | 2                   | 90%                         |
        | 3rd price details | 0                    | 09/Aug/Current Academic Year        | 0                      | 09/Aug/Current Academic Year          | Act2          | 3                   |                             |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
	# New OnProgrammeMathsAndEnglish column
    Then the following learner earnings should be generated
        | Delivery Period           | On-Programme | Completion | Balancing | OnProgrammeMathsAndEnglish |
        | Aug/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | Sep/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | Oct/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | Nov/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | Dec/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | Jan/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | Feb/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | Mar/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | Apr/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | May/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | Jun/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | Jul/Current Academic Year | 600          | 0          | 0         | 39.25                      |
    And only the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing | OnProgrammeMathsAndEnglish |
        | R01/Current Academic Year | Aug/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | R02/Current Academic Year | Sep/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | R03/Current Academic Year | Oct/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | R04/Current Academic Year | Nov/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | R05/Current Academic Year | Dec/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | R06/Current Academic Year | Jan/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | R07/Current Academic Year | Feb/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | R08/Current Academic Year | Mar/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | R09/Current Academic Year | Apr/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | R10/Current Academic Year | May/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | R11/Current Academic Year | Jun/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | R12/Current Academic Year | Jul/Current Academic Year | 600          | 0          | 0         | 39.25                      |
	# New transaction type and SFA Fully-Funded Payments column
    And only the following provider payments will be recorded
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type           |
        | R01/Current Academic Year | Aug/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R02/Current Academic Year | Sep/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R03/Current Academic Year | Oct/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R04/Current Academic Year | Nov/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R05/Current Academic Year | Dec/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R06/Current Academic Year | Jan/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R07/Current Academic Year | Feb/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R08/Current Academic Year | Mar/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R09/Current Academic Year | Apr/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R10/Current Academic Year | May/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R11/Current Academic Year | Jun/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R12/Current Academic Year | Jul/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R02/Current Academic Year | Sep/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R03/Current Academic Year | Oct/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R04/Current Academic Year | Nov/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R05/Current Academic Year | Dec/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R06/Current Academic Year | Jan/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R07/Current Academic Year | Feb/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R08/Current Academic Year | Mar/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R09/Current Academic Year | Apr/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R10/Current Academic Year | May/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R11/Current Academic Year | Jun/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R12/Current Academic Year | Jul/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
	And at month end only the following provider payments will be generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type           |
        | R01/Current Academic Year | Aug/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R02/Current Academic Year | Sep/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R03/Current Academic Year | Oct/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R04/Current Academic Year | Nov/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R05/Current Academic Year | Dec/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R06/Current Academic Year | Jan/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R07/Current Academic Year | Feb/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R08/Current Academic Year | Mar/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R09/Current Academic Year | Apr/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R10/Current Academic Year | May/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R11/Current Academic Year | Jun/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R12/Current Academic Year | Jul/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R02/Current Academic Year | Sep/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R03/Current Academic Year | Oct/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R04/Current Academic Year | Nov/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R05/Current Academic Year | Dec/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R06/Current Academic Year | Jan/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R07/Current Academic Year | Feb/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R08/Current Academic Year | Mar/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R09/Current Academic Year | Apr/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R10/Current Academic Year | May/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R11/Current Academic Year | Jun/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R12/Current Academic Year | Jul/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
Examples: 
        | Collection_Period         |
        | R01/Current Academic Year |
        | R02/Current Academic Year |
        | R03/Current Academic Year |
        | R04/Current Academic Year |
        | R05/Current Academic Year |
        | R06/Current Academic Year |
        | R07/Current Academic Year |
        | R08/Current Academic Year |
        | R09/Current Academic Year |
        | R10/Current Academic Year |
        | R11/Current Academic Year |
        | R12/Current Academic Year |