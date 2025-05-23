import 'package:craftybay/features/categories/model/category_model.dart';
import 'package:get/get.dart';

import '../../../app/app_urls.dart';
import '../../../core/network_caller/network_caller.dart';

class CategoryController extends GetxController {
  final int _perPageDataCount = 15;

  int _currentPage = 0;

  int? _totalPage;

  int? get totalPage => _totalPage;

  bool _isInitialLoading = true;

  bool get isInitialLoading => _isInitialLoading;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<CategoryModel> _categoryList = [];

  List<CategoryModel> get categoryList => _categoryList;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getCategoryList() async {
    if (_totalPage != null && _currentPage > _totalPage!) {
      return true;
    }

    bool isSuccess = false;
    _currentPage++;
    if (!_isInitialLoading) {
      _isLoading = true;
    }
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: AppUrls.categoriesUrl, queryParams: {
      'count': _perPageDataCount,
      'page': _currentPage,
    });
    if (response.isSuccess) {
      List<CategoryModel> list = [];
      for (Map<String, dynamic> data in response.responseData!['data']
          ['results']) {
        list.add(CategoryModel.fromJson(data));
      }
      _categoryList.addAll(list);
      _totalPage = response.responseData!['data']['last_page'];

      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    if (!_isInitialLoading) {
      _isLoading = false;
    } else {
      _isInitialLoading = false;
    }

    update();

    return isSuccess;
  }

  Future<bool> refreshList() {
    _currentPage = 0;
    _categoryList = [];
    _isInitialLoading = true;
    return getCategoryList();
  }
}
