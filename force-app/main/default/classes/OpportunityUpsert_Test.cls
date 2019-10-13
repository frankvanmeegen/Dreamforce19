@IsTest
public class OpportunityUpsert_Test {

    @IsTest
    static void opportunityStageClosedWonTest() {
        
        //Arrange
        Account acc = new Account(Name = 'WolfTech',
                                  Website = 'www.wolf-tech.nl');
        insert acc;
        
        Opportunity opp = new Opportunity(Name = 'WolfTech OPP01',
                                          StageName = 'Prospecting',
                                          AccountId = acc.Id,
                                          CloseDate = Date.today()+365);
        insert opp;
        
        //Act
        opp.StageName = 'Closed Won';
        update opp;
        
        //Assert
        Opportunity updatedOpp = [SELECT Id, Name, StageName, CloseDate, Account.Type 
                                  FROM Opportunity 
                                  WHERE Id = :opp.Id LIMIT 1];
        System.assertEquals(Date.today(), updatedOpp.CloseDate);
        
        
    }
    
}