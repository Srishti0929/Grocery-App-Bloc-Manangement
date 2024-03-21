import 'package:firebase_project/features/home/bloc/home_bloc_bloc.dart';
import 'package:firebase_project/features/home/models/home_product_data_models.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBlocBloc homeBlocBloc;
  const ProductTileWidget({super.key, required this.productDataModel, required this.homeBlocBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            productDataModel.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(productDataModel.description),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ " + productDataModel.price.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                       homeBlocBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: productDataModel));
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: () {
                        homeBlocBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: productDataModel));
                      },
                      icon: Icon(
                        Icons.shopping_basket_outlined,
                        color: Colors.black,
                      ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}