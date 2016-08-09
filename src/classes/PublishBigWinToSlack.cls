public with sharing class PublishBigWinToSlack {
     
    private static final String slackURL = 'WEBHOOK_URL';
     
    public class Oppty {
        @InvocableVariable(label='Opportunity Name')
        public String opptyName;
        @InvocableVariable(label='Stage')
        public String stage;
        @InvocableVariable(label='Id')
        public String opptyId;
        @InvocableVariable(label='Ammount')
        public Double amount;
    }
}