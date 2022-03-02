@isTest
public class TestEmailTrigger {
    @isTest 
    static void TestAddMovie() {
        // Test data setup
        Inventory__c newInventory = new Inventory__c(Name='Test Inventory');
        insert newInventory;
        // Create a movie        
        Movie__c movie = new Movie__c(Name='Test Movie');
        movie.Inventory_of_Movies__c= newInventory.Id;
        
        // Perform test
        Test.startTest();
        insert movie;
        Test.stopTest();
        
        // Verify 
        Movie__c m = [SELECT Name FROM Movie__c WHERE Name = 'Test Movie'];
        System.assert(m.Name!= Null, 'It is expected to have a movie');
        
    }
    @isTest 
    static void TestDeleteMovie() {
        // Test data setup
        // Create a movie
        Inventory__c newInventory = new Inventory__c(Name='Test Inventory');
        insert newInventory;
        Movie__c movie = new Movie__c(Name='Test Movie');
        movie.Inventory_of_Movies__c= newInventory.Id;
        insert movie;
        
        //List<Movie__c> movieList = [SELECT Id FROM Movie__c WHERE Name LIKE '%Test%'];
        
        // Perform test
        Test.startTest();
        delete movie;
        Test.stopTest();
     
        // Verify 
        List<Movie__c> m = [SELECT Name FROM Movie__c WHERE Name = 'Test Movie'];
        System.assert(m.Size()==0, 'It is expected to delete a movie');
    }
    
}