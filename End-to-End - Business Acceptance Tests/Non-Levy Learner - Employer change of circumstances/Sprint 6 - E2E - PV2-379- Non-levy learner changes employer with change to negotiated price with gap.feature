#@Changeofemployersameprovider
##AC1
#Scenario:AC1- Non-levy, provider earnings and payments where learner changes employer  - provider receives payment during the gap as they amend the ACT code and employment status code correctly.
#        Given The learner is programme only non-DAS
#        And the apprenticeship funding band maximum is 17000
#        And the learner changes employers
#            | Employer    | Type    | ILR employment start date |   
#            | employer 1  | Non-DAS | 03/08/2018                |
#            | No employer | Non-DAS | 03/10/2018                |
#            | employer 2  | Non-DAS | 03/11/2018                |
#        
#        When an ILR file is submitted with the following data:
#            | ULN       | Provider   | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date | Residual training price | Residual training price effective date | Residual assessment price | Residual assessment price effective date |
#            | learner a | provider a | 03/08/2018 | 04/08/2019       |                 | continuing        | 12000                | 03/08/2018                          | 3000                   | 03/08/2018                            | 4500                    | 03/11/2018                             | 1125                      | 03/11/2018                               |
#        And the Contract type in the ILR is:
#            | contract type | date from  | date to    |
#            | Non-DAS       | 03/08/2018 | 02/10/2018 |
#            | Non-DAS       | 03/10/2018 | 02/11/2018 |
#            | Non-DAS       | 03/11/2018 | 04/08/2019 |
#        And the employment status in the ILR is
#            | Employer   | Employment Status      | Employment Status Applies |
#            | employer 1 | in paid employment     | 02/08/2018                |
#            |            | not in paid employment | 03/10/2018                |
#            | employer 2 | in paid employment     | 03/11/2018                |         
#     
#     Then the provider earnings and payments break down as follows:
#            | Type                       		| 08/18 | 09/18 | 10/18 | 11/18 | 12/18 |
#            | Provider Earned Total      		| 1000  | 1000  | 1000  | 500   | 500   |
#            | Provider Earned from SFA   		| 900   |  900  | 1000  | 450   | 450   |
#            | Provider Earned from Employer 	| 100   |  100  |    0  | 50    | 50    |            
#			| Provider Paid by SFA       		| 0     |  900  |  900  | 1000  | 450   |
#            | Payment due from Employer         | 0     |  100  |  100  | 0     | 50    | .
#			| Levy account debited       		| 0     |    0  |    0  | 0     | 0     |
#            | SFA Levy employer budget   		| 0     |    0  |    0  | 0     | 0     |
#            | SFA Levy co-funding budget 		| 0     |    0  |    0  | 0     | 0     |
#			| SFA non-Levy co-funding budget	| 900   |  900  | 1000  | 450   | 450   |

Feature: Non-levy learner changes employer and there is a gap - provider receives payment during the gap as they amend the ACT code and employment status code correctly
#Notes - check if not in employment is OK in examples?
# multiple prices in same line or just the residual. If just residual then also check for the duration and start date
# And the employment status in the ILR is - multiple statuses
# Also, check employer column in payments
	#And the employment status in the ILR is
 #       | Employer   | Employment Status      | Employment Status Applies    | Small Employer |
 #       | employer 1 | in paid employment     | 03/Aug/Current Academic Year |                |
 #       |            | not in paid employment | 03/Oct/Current Academic Year |                |
 #       | employer 2 | in paid employment     | 03/Nov/Current Academic Year |                |


Scenario Outline: Non-levy learner changes employer and there is a gap - provider receives payment during the gap PV2-379
    Given the following learners
		| Learner Reference Number | Uln      |
		| na                       | 12345678 |
	And the following aims
		| Aim Reference | Start Date                   | Planned Duration | Actual Duration | Aim Sequence Number | Framework Code | Pathway Code | Programme Type | Funding Line Type             | Completion Status |
		| ZPROG001      | 03/Aug/Current Academic Year | 12 months        |                 | 1                   | 403            | 1            | 25             | 16-18 Apprenticeship Non-Levy | continuing        |
	And price details as follows		
        | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage |
        | 12000                | 03/Aug/Current Academic Year        | 3000                   | 03/Aug/Current Academic Year          | Act2          | 1                   | 90%                         |
        | 12000                | 03/Oct/Current Academic Year        | 3000                   | 03/Oct/Current Academic Year          | Act2          | 1                   | 100%                        |
    And the following earnings had been generated for the learner
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 1000         | 0          | 0         |
        | Sep/Current Academic Year | 1000         | 0          | 0         |
        | Oct/Current Academic Year | 1000         | 0          | 0         |
        | Nov/Current Academic Year | 1000         | 0          | 0         |
        | Dec/Current Academic Year | 1000         | 0          | 0         |
        | Jan/Current Academic Year | 1000         | 0          | 0         |
        | Feb/Current Academic Year | 1000         | 0          | 0         |
        | Mar/Current Academic Year | 1000         | 0          | 0         |
        | Apr/Current Academic Year | 1000         | 0          | 0         |
        | May/Current Academic Year | 1000         | 0          | 0         |
        | Jun/Current Academic Year | 1000         | 0          | 0         |
        | Jul/Current Academic Year | 1000         | 0          | 0         |
    And the following provider payments had been generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 900                    | 100                         | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 1000                   | 0                           | Learning         |
	But price details have been changed as follows		
        | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Residual Training Price | Residual Training Price Effective Date | Residual Assessment Price | Residual Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage |
        | 12000                | 03/Aug/Current Academic Year        | 3000                   | 03/Aug/Current Academic Year          | 4500                    | 03/Nov/Current Academic Year           | 1125                      | 03/Nov/Current Academic Year             | Act2          | 1                   | 90%                         |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing | 
        | Aug/Current Academic Year | 1000         | 0          | 0         |
        | Sep/Current Academic Year | 1000         | 0          | 0         |
        | Oct/Current Academic Year | 1000         | 0          | 0         |
        | Nov/Current Academic Year | 500          | 0          | 0         |
        | Dec/Current Academic Year | 500          | 0          | 0         |
        | Jan/Current Academic Year | 500          | 0          | 0         |
        | Feb/Current Academic Year | 500          | 0          | 0         |
        | Mar/Current Academic Year | 500          | 0          | 0         |
        | Apr/Current Academic Year | 500          | 0          | 0         |
        | May/Current Academic Year | 500          | 0          | 0         |
        | Jun/Current Academic Year | 500          | 0          | 0         |
        | Jul/Current Academic Year | 500          | 0          | 0         |
    And only the following payments will be calculated
		| Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
		| R04/Current Academic Year | Nov/Current Academic Year | 500          | 0          | 0         |
		| R05/Current Academic Year | Dec/Current Academic Year | 500          | 0          | 0         |
		| R06/Current Academic Year | Jan/Current Academic Year | 500          | 0          | 0         |
		| R07/Current Academic Year | Feb/Current Academic Year | 500          | 0          | 0         |
		| R08/Current Academic Year | Mar/Current Academic Year | 500          | 0          | 0         |
		| R09/Current Academic Year | Apr/Current Academic Year | 500          | 0          | 0         |
		| R10/Current Academic Year | May/Current Academic Year | 500          | 0          | 0         |
		| R11/Current Academic Year | Jun/Current Academic Year | 500          | 0          | 0         |
		| R12/Current Academic Year | Jul/Current Academic Year | 500          | 0          | 0         |
	And only the following provider payments will be recorded
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| R04/Current Academic Year | Nov/Current Academic Year | 450                    | 50                          | Learning         |
		| R05/Current Academic Year | Dec/Current Academic Year | 450                    | 50                          | Learning         |
		| R06/Current Academic Year | Jan/Current Academic Year | 450                    | 50                          | Learning         |
		| R07/Current Academic Year | Feb/Current Academic Year | 450                    | 50                          | Learning         |
		| R08/Current Academic Year | Mar/Current Academic Year | 450                    | 50                          | Learning         |
		| R09/Current Academic Year | Apr/Current Academic Year | 450                    | 50                          | Learning         |
		| R10/Current Academic Year | May/Current Academic Year | 450                    | 50                          | Learning         |
		| R11/Current Academic Year | Jun/Current Academic Year | 450                    | 50                          | Learning         |
		| R12/Current Academic Year | Jul/Current Academic Year | 450                    | 50                          | Learning         |
	And at month end only the following provider payments will be generated
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| R04/Current Academic Year | Nov/Current Academic Year | 450                    | 50                          | Learning         |
		| R05/Current Academic Year | Dec/Current Academic Year | 450                    | 50                          | Learning         |
		| R06/Current Academic Year | Jan/Current Academic Year | 450                    | 50                          | Learning         |
		| R07/Current Academic Year | Feb/Current Academic Year | 450                    | 50                          | Learning         |
		| R08/Current Academic Year | Mar/Current Academic Year | 450                    | 50                          | Learning         |
		| R09/Current Academic Year | Apr/Current Academic Year | 450                    | 50                          | Learning         |
		| R10/Current Academic Year | May/Current Academic Year | 450                    | 50                          | Learning         |
		| R11/Current Academic Year | Jun/Current Academic Year | 450                    | 50                          | Learning         |
		| R12/Current Academic Year | Jul/Current Academic Year | 450                    | 50                          | Learning         |
Examples:
        | Collection_Period         |
        | R04/Current Academic Year |
        | R05/Current Academic Year |
        | R06/Current Academic Year |
        | R07/Current Academic Year |
        | R08/Current Academic Year |
        | R09/Current Academic Year |
        | R10/Current Academic Year |
        | R11/Current Academic Year |
        | R12/Current Academic Year |