public with sharing class PublishBigWinToSlack {
     
    private static final String slackURL = 'https://hooks.slack.com/services/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';
     
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