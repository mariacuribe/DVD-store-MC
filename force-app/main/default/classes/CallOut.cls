public with sharing class CallOut implements Database.AllowsCallouts
{
    @future(callout=true)
    public static void SearchM (String movieName){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://www.omdbapi.com/?apikey=2d4ad763&t='+ movieName);
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
           Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
           System.debug(results.tostring()); 
           System.debug(movieName); 
           Movie__c mo = [select Id, Name, Actor__c from Movie__c where Name=:movieName]; 
           mo.Actor__c = results.get('Actors').tostring();
           update mo;
        }
    }
}