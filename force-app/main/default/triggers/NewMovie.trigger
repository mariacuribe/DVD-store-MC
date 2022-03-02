trigger NewMovie on Movie__c (after insert, after delete) {
    if (Trigger.isInsert) {
        Movie__c movie = Trigger.New[0];
        String movieName = (String) movie.Name;        
        // Call a utility method from another class
        EmailManager.sendMail('mariac.uribe1606@gmail.com', 'Alert! New movie added' , 
                    'New movie in your store: ' + movieName);
    }
    else if (Trigger.isDelete) {
        Movie__c movie = Trigger.Old[0];
        String movieName = (String) movie.Name;        
        //Call a utility method from another class
        EmailManager.sendMail('mariac.uribe1606@gmail.com', 'Alert! Deleted Movie', 
                    'This movie was deleted from your inventory: ' + movieName);
    }
}