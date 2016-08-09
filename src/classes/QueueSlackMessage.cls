public class QueueSlackMessage implements System.Queueable, Database.AllowsCallouts {
         
  private final String url;
  private final String method;
  private final String body;

  public class Message {
    @InvocableVariable(label='Title')
    public String title;
    @InvocableVariable(label='Message')
    public String message;
    @InvocableVariable(label='Link')
    public String moreDetails;
  }

  @InvocableMethod(label='Queue Slack Message')
  public static void postToSlack(List<Message> oppties) {
    Message m = oppties[0]; // If bulk, only post first to avoid overloading Slack channel
    Map<String,Object> msg = new Map<String,Object>();
    String body = '';
    body += '> **' + m.title + '** \n';
    body += '> ' + m.message + '\n';
    if(m.moreDetails != null){
      body += '> *' + m.moreDetails + '*'; 
    }
    msg.put('text', body);
    msg.put('mrkdwn', true);
    String jsonMessage = JSON.serialize(msg); 
    System.enqueueJob(new QueueSlackMessage(jsonMessage));
  }  
         
  public QueueSlackMessage(String message) {
    this.url = 'https://hooks.slack.com/services/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';
    this.method = 'POST';
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