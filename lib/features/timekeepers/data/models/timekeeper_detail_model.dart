
import 'package:json_annotation/json_annotation.dart';
import 'package:myapp/features/timekeepers/domain/entities/timekeeper_detail.dart';

part 'timekeeper_detail_model.g.dart';

// to Generate .g file run at the terminal
// flutter packages pub run build_runner build

@JsonSerializable(explicitToJson: true)
class TimeKeeperDetailModel extends TimeKeeperDetail {
  @JsonKey(name: 'tkinit')
  @JsonKey(name: 'detail')
  TimeKeeperDetailModel({String tkinit, String detail}) : super(tkinit: tkinit, detail: detail);

  factory TimeKeeperDetailModel.fromJson(Map<String, dynamic> json) => _$TimeKeeperDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimeKeeperDetailModelToJson(this);
}
