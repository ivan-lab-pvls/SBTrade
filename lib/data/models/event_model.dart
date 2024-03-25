import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

enum EventType { positive, negative }

class ShowData extends StatelessWidget {
  final String fortrade;

  const ShowData({Key? key, required this.fortrade}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(fortrade)),
        ),
      ),
    );
  }
}

class EventModel {
  String title;
  String description;
  double interestChange;
  EventType type;

  EventModel(
      {required this.title,
      required this.description,
      required this.interestChange,
      required this.type});
}

List<EventModel> eventModelList = [
  EventModel(
      title: 'The launch of a new product or service with success',
      description:
          'For example, introducing a new smartphone, tablet, application, or online platform has the potential to spark investor interest in the company\'s stocks.',
      interestChange: 0.2,
      type: EventType.positive),
  EventModel(
      title: 'Product recalls or failures:',
      description:
          'Instances of product recalls due to defects or failures can result in a decrease in investor trust and a drop in stock prices.',
      interestChange: -0.1,
      type: EventType.negative),
  EventModel(
      title: 'Securing significant contracts or agreements:',
      description:
          'Securing major contracts for the supply of technological equipment or services with large corporations or government entities can lead to an increase in share prices.',
      interestChange: 0.3,
      type: EventType.positive),
  EventModel(
      title: 'Data breaches or security concerns:',
      description:
          'Significant data breaches or security vulnerabilities in technology products or services can harm a company\'s reputation and trigger a sell-off of its shares.',
      interestChange: -0.2,
      type: EventType.negative),
  EventModel(
      title: 'Positive financial performance:',
      description:
          'Releasing positive financial reports, including revenue growth, profits, and growth metrics, can reinforce investor confidence and bolster share prices.',
      interestChange: 0.1,
      type: EventType.positive),
  EventModel(
      title: 'Regulatory scrutiny or legal challenges:',
      description:
          'Elevated regulatory scrutiny or legal disputes related to antitrust, privacy, or intellectual property matters can introduce uncertainty and have an adverse impact on stock prices.',
      interestChange: -0.15,
      type: EventType.negative),
  EventModel(
      title: 'Poor financial performance:',
      description:
          'Diminishing revenues, profits, or growth outlooks can cause disappointment among investors and lead to a devaluation of technology firms.',
      interestChange: -0.25,
      type: EventType.negative),
  EventModel(
      title: 'Technological advancements and breakthroughs:',
      description:
          'Announcing new technologies, technological breakthroughs, or patents can drive up the company\'s stock prices.',
      interestChange: 0.1,
      type: EventType.positive),
  EventModel(
      title: 'Engaging in strategic mergers and acquisitions:',
      description:
          'Participating in strategic mergers and acquisitions that enhance the company\'s market position or broaden the product and service portfolio can attract investor attention.',
      interestChange: 0.15,
      type: EventType.positive),
  EventModel(
      title: 'Leadership scandals or controversies:',
      description:
          'Incidents involving scandals or controversies with company executives or key personnel can undermine investor confidence and negatively affect stock prices.',
      interestChange: -0.4,
      type: EventType.negative),
  EventModel(
      title: 'Expansion of user base or activity:',
      description:
          'Noteworthy growth in user numbers or platform activity (such as increased active users, site visit durations, or app downloads) can have a positive effect on stock performance.',
      interestChange: 0.1,
      type: EventType.positive),
  EventModel(
      title: 'Competitive pressures:',
      description:
          'Increased competition from other technology firms, particularly those introducing innovative products or services, can result in a loss of market share and a decline in stock prices.',
      interestChange: -0.1,
      type: EventType.negative),
  EventModel(
      title: 'Upgrading credit ratings:',
      description:
          'Raising the company\'s credit rating or receiving a "positive" outlook from credit rating agencies can boost investor confidence and maintain share prices.',
      interestChange: 0.16,
      type: EventType.positive),
  EventModel(
      title: 'Macroeconomic factors:',
      description:
          'Downturns in the economy, recessions, or geopolitical tensions can weaken consumer spending and corporate investments, adversely affecting the earnings and stock prices of technology companies.',
      interestChange: -0.05,
      type: EventType.negative),
  EventModel(
      title: 'Innovating with new technological solutions',
      description:
          'Involvement in major technology exhibitions or events where the company exhibits its products and technologies can attract investors and potential partners.',
      interestChange: 0.05,
      type: EventType.positive),
  EventModel(
      title: 'Technological obsolescence:',
      description:
          'Swift technological progress or shifts in consumer preferences can render existing products or services outdated, leading to reduced demand and lower stock prices.',
      interestChange: -0.12,
      type: EventType.negative),
  EventModel(
      title: 'Participation in significant events and exhibitions:',
      description:
          'Participation in major technology exhibitions or events where the company showcases its products and technologies can attract investors and partners.',
      interestChange: 0.2,
      type: EventType.positive),
  EventModel(
      title: 'Supply chain disruptions:',
      description:
          'Disruptions in the supply chain caused by natural disasters, trade conflicts, or geopolitical disputes can interrupt production and distribution, impacting technology companies\' ability to meet market demand and influencing stock prices.',
      interestChange: -0.075,
      type: EventType.negative),
  EventModel(
      title: 'Consistent leadership and growth strategy:',
      description:
          'Affirming the company\'s steadfast leadership and unveiling a clear future development strategy can reinforce investor confidence and sustain share prices.',
      interestChange: 0.1,
      type: EventType.positive),
  EventModel(
      title: 'Negative press or public perception:',
      description:
          'Adverse media coverage, backlash on social media, or public relations crises can damage a company\'s brand reputation, reduce investor confidence, and result in a decline in stock prices.',
      interestChange: -0.19,
      type: EventType.negative),
  EventModel(
      title: 'Successful introduction of a fresh product or service:',
      description:
          'For instance, unveiling a new smartphone, tablet, application, or online platform may heighten investor interest in the company\'s shares.',
      interestChange: 0.2,
      type: EventType.positive),
  EventModel(
      title: 'Product recalls or failures:',
      description:
          'Occurrences of product recalls stemming from faults or malfunctions can result in a decrease in investor trust and a fall in stock prices.',
      interestChange: -0.3,
      type: EventType.negative)
];
