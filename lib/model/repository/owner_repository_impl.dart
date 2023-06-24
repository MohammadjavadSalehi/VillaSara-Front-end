import '../../model/entity/owner.dart';
import '../util/constants.dart';
import 'owner_repository.dart';

class OwnerRepositoryImpl extends OwnerRepository {

  @override
  Future<List<Owner>> getOwners() async {
    var response = await dio.get('landowners/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Owner> owners = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var owner = Owner.fromJson(data);
          owners.add(owner);
        }
      }
      return owners;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<List<Owner>> searchOwners(int id)  async {
    var response = await dio.get('landowners/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Owner> owners = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var owner = Owner.fromJson(data);
          if(owner.id == id) {
            owners.add(owner);
          }
        }
      }
      return owners;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<List<Owner>> searchPhone(String Phone) async{
    var response = await dio.get('landowners/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Owner> owners = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var owner = Owner.fromJson(data);
          if(owner.phone_number == Phone) {
            owners.add(owner);
          }
        }
      }
      return owners;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<Owner> addOwner(Owner owner) async {
    var response = await dio.post(
      'landowners/',
      data: owner,
    );
    print('response: ${response.statusMessage}');
    print('response: ${response.data}');
    final newOwner = Owner.fromJson(response.data);
    return newOwner;
  }
  @override
  Future<void> editOwner(Owner owner) async {
    var response = await dio.patch(
      'landowners/${owner.id}/',
      data: owner,
    );
    print('response: ${response.statusMessage}');
  }
  @override
  Future<void> deleteOwner(Owner owner) async {
    var response = await dio.delete(
      'landowners/${owner.id}/',
    );
    print('response: ${response.statusMessage}');
  }

}