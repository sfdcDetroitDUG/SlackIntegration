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

    @InvocableMethod(label='Post Win to Slack')
    public static void postToSlack(List<Oppty> oppties) {
        Oppty o = oppties[0]; // If bulk, only post first to avoid overloading Slack channel
        Map<String,Object> msg = new Map<String,Object>();
        msg.put('text', 'The following opportunity has been won! :\n' + o.opptyName + '\nAmmount: *' + o.amount + '*');
        msg.put('mrkdwn', true);
        String body = JSON.serialize(msg); 
        System.enqueueJob(new QueueableSlackCall(slackURL, 'POST', body));
    }
    
}