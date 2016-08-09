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


    public class QueueableSlackCall implements System.Queueable, Database.AllowsCallouts {
         
        private final String url;
        private final String method;
        private final String body;
         
        public QueueableSlackCall(String url, String method, String body) {
            this.url = url;
            this.method = method;
            this.body = body;
        }
         
        public void execute(System.QueueableContext ctx) {
            HttpRequest req = new HttpRequest();
            req.setEndpoint(url);
            req.setMethod(method);
            req.setBody(body);
            Http http = new Http();
            HttpResponse res = http.send(req);
        }
 
    }
    
}