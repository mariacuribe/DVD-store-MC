trigger UpdateMovie on Movie__c (after insert) {
    for (Movie__c m:Trigger.New){
        CallOut.SearchM(m.Name);
    }
}