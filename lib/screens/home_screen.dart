import 'package:calculator_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit.dart';
import '../shared/components/buttom_item.dart';
import '../shared/components/input_or_output.dart';
import '../shared/components/list_operator.dart';
import '../shared/cubit/cubit.dart';
import '../shared/styles/colors.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<CalculatorCubit,CalculatorStates>(
        listener: (context , state){},
        builder: (context , state){
          var cubit =CalculatorCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeAppMode();
                  },
                  icon:const Icon(Icons.brightness_4_outlined),
                ),
              ],
            ),
            body: SizedBox(
              width: width,
              height: height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: InputOutputItem(
                      color: AppCubit.get(context).isDark
                          ? white
                          : questionClrLight,
                      text: cubit.input,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InputOutputItem(
                      color: AppCubit.get(context).isDark
                          ? purpleClrDark
                          : purpleClrLight,
                      text: cubit.output,
                      textAlign: TextAlign.right,
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02, vertical: height * 0.01),
                    width: width,
                    height: height * 0.65,
                    child: GridView.builder(
                      reverse: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: width * 0.04,
                          crossAxisSpacing: height * 0.02,
                          crossAxisCount: 5),
                      itemCount: cubit.buttons.length,
                      itemBuilder: (BuildContext context, int index) {

                        if ( index == 3 ) {
                          return buttomItem(
                              textColor:
                              AppCubit.get(context).isDark ? purpleClrDark : purpleClrLight,
                              backgroundColor: AppCubit.get(context).isDark
                                  ? btnBackgroundClrDark
                                  : btnBackgroundClrLight,
                              textString: cubit.buttons[index],
                              onTap: () {
                                cubit.handleButtonPress(
                                    cubit.buttons[index]);
                              });
                        }else if(index == 25 || index == 26){
                          return buttomItem(
                              textColor:
                              AppCubit.get(context).isDark ? white : black,
                              backgroundColor: AppCubit.get(context).isDark
                                  ? btnDelBackgroundClrDark
                                  : btnDelBackgroundClrDark,
                              textString: cubit.buttons[index],
                              onTap: () {
                                cubit.handleButtonPress(
                                    cubit.buttons[index]);
                              });
                        }



                        else {
                          return buttomItem(
                            textColor: isOperator(cubit.buttons[index])
                                ? AppCubit.get(context).isDark
                                ? purpleClrDark
                                : purpleClrLight
                                : AppCubit.get(context).isDark
                                ? white
                                : black,
                            backgroundColor: AppCubit.get(context).isDark
                                ? btnBackgroundClrDark
                                : btnBackgroundClrLight,
                            onTap: () {
                              cubit.handleButtonPress(
                                  cubit.buttons[index]);
                            },
                            textString: cubit.buttons[index],
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },

    );
  }

}