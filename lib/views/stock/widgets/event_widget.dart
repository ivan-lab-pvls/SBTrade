import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trader_simulator/consts/app_text_styles/portfolio_text_style.dart';
import '../../../consts/app_colors.dart';
import '../../../data/models/event_model.dart';

class EventWidget extends StatelessWidget {
  final EventModel? event;

  EventWidget(this.event);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: AppColors.darkGreyColor,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/rate.svg'),
                  const SizedBox(width: 4.0),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Last event',
                            style: PortfolioTextStyle.lastEvent),
                        const SizedBox(height: 2.0),
                        Text(
                          event!.title,
                          style: PortfolioTextStyle.eventTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2.0),
                        Expanded(
                          child: Text(
                            event!.description,
                            style: PortfolioTextStyle.eventText,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4.0),
          ],
        ),
      ),
    );
  }
}
