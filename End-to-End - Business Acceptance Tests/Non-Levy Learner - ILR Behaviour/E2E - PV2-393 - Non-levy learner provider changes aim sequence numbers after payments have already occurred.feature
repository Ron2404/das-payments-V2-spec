#Non Levy apprentice, provider changes aim sequence numbers in ILR after payments have already occurred
#(657.75 11/18 payment includes 08/18 and 09/18 English & Maths payments)
#
#Profile remains the same, don't pull back and re-pay when the aim sequence number changes.  Need to use this to ensure continuation of payments.
#
#        Given the apprenticeship funding band maximum is 9000
#
#        When an ILR file is submitted for period R01 with the following data:
#			| ULN       | learner type           | agreed price | start date | planned end date | actual end date | completion status | aim type  | aim sequence number | aim rate | framework code | programme type | pathway code |
#			| learner a | programme only non-DAS | 9000         | 06/08/2018 | 20/08/2019       |                 | continuing        | programme | 1                   |          | 403            | 2              | 1            |
#        
#        And an ILR file is submitted for period R03 with the following data:
#			| ULN       | learner type           | agreed price | start date | planned end date | actual end date | completion status | aim type         | aim sequence number | aim rate | framework code | programme type | pathway code |
#			| learner a | programme only non-DAS | 9000         | 06/08/2018 | 20/08/2019       |                 | continuing        | programme        | 2                   |          | 403            | 2              | 1            |
#			| learner a | programme only non-DAS |              | 06/08/2018 | 20/08/2019       |                 | continuing        | maths or english | 1                   | 471      | 403            | 2              | 1            |
#  	
#        Then the provider earnings and payments break down as follows:
#			| Type                                    | 08/18 | 09/18 | 10/18  | 11/18  |
#			| Provider Earned Total                   | 600   | 600   | 639.25 | 639.25 |
#			| Provider Earned from SFA                | 540   | 540   | 579.25 | 0      |
#			| Provider Earned from Employer           | 60    | 60    | 60     | 0      |
#			| Provider Paid by SFA                    | 0     | 540   | 540    | 657.75 |
#			| Refund taken by SFA                     | 0     | 0     | 0      | 0      |
#			| Payment due from Employer               | 0     | 60    | 60     | 60     |
#			| Refund due to employer                  | 0     | 0     | 0      | 0      |
#			| Levy account debited                    | 0     | 0     | 0      | 0      |
#			| Levy account credited                   | 0     | 0     | 0      | 0      |
#			| SFA Levy employer budget                | 0     | 0     | 0      | 0      |
#			| SFA Levy co-funding budget              | 0     | 0     | 0      | 0      |
#			| SFA Levy additional payments budget     | 0     | 0     | 0      | 0      |
#			| SFA non-Levy co-funding budget          | 540   | 540   | 540    | 540    |
#			| SFA non-Levy additional payments budget | 39.25 | 39.25 | 39.25  | 39.25  |

#Notes: New fields in the learner table -  Aim Type  and Aim Rate 
		#Discuss with Alex - Names for incentives
		# Query - Aim Reference for 'Maths and English' - Should this be ZPROG as well


Feature: Non-levy learner, provider changes aim sequence numbers after payments have already occurred

Scenario Outline: Non-levy learner provider changes aim sequence numbers after payments have already occurred PV2-393

	Given the provider previously submitted the following learner details
        | Priority | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage | Aim Type  | Aim Rate |
        | 1        | 06/Aug/Current Academic Year | 12 months        | 9000                 | 06/Aug/Current Academic Year        | 0                      | 06/Aug/Current Academic Year          |                 | continuing        | Act2          | 1                   | ZPROG001      | 403            | 1            | 2              | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         | Programme |          |
    And the following earnings had been generated for the learner
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 600          | 0          | 0         |
        | Sep/Current Academic Year | 600          | 0          | 0         |
        | Oct/Current Academic Year | 600          | 0          | 0         |
        | Nov/Current Academic Year | 600          | 0          | 0         |
        | Dec/Current Academic Year | 600          | 0          | 0         |
        | Jan/Current Academic Year | 600          | 0          | 0         |
        | Feb/Current Academic Year | 600          | 0          | 0         |
        | Mar/Current Academic Year | 600          | 0          | 0         |
        | Apr/Current Academic Year | 600          | 0          | 0         |
        | May/Current Academic Year | 600          | 0          | 0         |
        | Jun/Current Academic Year | 600          | 0          | 0         |
        | Jul/Current Academic Year | 600          | 0          | 0         |
    And the following provider payments had been generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 540                    | 60                          | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 540                    | 60                          | Learning         |
    But the Provider now changes the Learner details as follows
        | Priority | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage | Aim Type         | Aim Rate |
        | 1        | 06/Aug/Current Academic Year | 12 months        | 9000                 | 06/Aug/Current Academic Year        | 0                      | 06/Aug/Current Academic Year          |                 | continuing        | Act2          | 2                   | ZPROG001      | 403            | 1            | 2              | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         | Programme        |          |
        | 1        | 06/Aug/Current Academic Year | 12 months        | 9000                 | 06/Aug/Current Academic Year        | 0                      | 06/Aug/Current Academic Year          |                 | continuing        | Act2          | 1                   | ZPROG001      | 403            | 1            | 2              | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         | Maths or English | 471      |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
    Then the following learner earnings should be generated
        | Delivery Period           | On-Programme | Completion | Balancing | Maths or English |
        | Aug/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | Sep/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | Oct/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | Nov/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | Dec/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | Jan/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | Feb/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | Mar/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | Apr/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | May/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | Jun/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | Jul/Current Academic Year | 600          | 0          | 0         | 39.25            |
    And only the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing | Maths or English |
        | R03/Current Academic Year | Aug/Current Academic Year | 0            | 0          | 0         | 39.25            |
        | R03/Current Academic Year | Sep/Current Academic Year | 0            | 0          | 0         | 39.25            |
		| R03/Current Academic Year | Oct/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | R04/Current Academic Year | Nov/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | R05/Current Academic Year | Dec/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | R06/Current Academic Year | Jan/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | R07/Current Academic Year | Feb/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | R08/Current Academic Year | Mar/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | R09/Current Academic Year | Apr/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | R10/Current Academic Year | May/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | R11/Current Academic Year | Jun/Current Academic Year | 600          | 0          | 0         | 39.25            |
        | R12/Current Academic Year | Jul/Current Academic Year | 600          | 0          | 0         | 39.25            |
    And only the following provider payments will be recorded
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type |
        | R03/Current Academic Year | Oct/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R04/Current Academic Year | Nov/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R05/Current Academic Year | Dec/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R06/Current Academic Year | Jan/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R07/Current Academic Year | Feb/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R08/Current Academic Year | Mar/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R09/Current Academic Year | Apr/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R10/Current Academic Year | May/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R11/Current Academic Year | Jun/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R12/Current Academic Year | Jul/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R03/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
		| R03/Current Academic Year | Sep/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
		| R03/Current Academic Year | Oct/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R04/Current Academic Year | Nov/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R05/Current Academic Year | Dec/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R06/Current Academic Year | Jan/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R07/Current Academic Year | Feb/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R08/Current Academic Year | Mar/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R09/Current Academic Year | Apr/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R10/Current Academic Year | May/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R11/Current Academic Year | Jun/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R12/Current Academic Year | Jul/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
	And at month end only the following provider payments will be generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type |
        | R03/Current Academic Year | Oct/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R04/Current Academic Year | Nov/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R05/Current Academic Year | Dec/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R06/Current Academic Year | Jan/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R07/Current Academic Year | Feb/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R08/Current Academic Year | Mar/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R09/Current Academic Year | Apr/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R10/Current Academic Year | May/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R11/Current Academic Year | Jun/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R12/Current Academic Year | Jul/Current Academic Year | 540                    | 60                          | 0                         | Learning         |
        | R03/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
		| R03/Current Academic Year | Sep/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
		| R03/Current Academic Year | Oct/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R04/Current Academic Year | Nov/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R05/Current Academic Year | Dec/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R06/Current Academic Year | Jan/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R07/Current Academic Year | Feb/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R08/Current Academic Year | Mar/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R09/Current Academic Year | Apr/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R10/Current Academic Year | May/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R11/Current Academic Year | Jun/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
        | R12/Current Academic Year | Jul/Current Academic Year | 0                      | 0                           | 39.25                     | Maths or English |
Examples: 
        | Collection_Period         |
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