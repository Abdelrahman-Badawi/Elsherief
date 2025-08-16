// import 'package:flutter/material.dart';

// class Files extends StatelessWidget {
//   const Files({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
        
//         // عرض متجاوب: عمود للشاشات الصغيرة، صف للشاشات الكبيرة
//         LayoutBuilder(
//           builder: (context, constraints) {
//             if (constraints.maxWidth < 768) {
//               // عرض عمودي للشاشات الصغيرة (Mobile)
//               return Column(
//                 children: [
                  
                  
//                 ],
//               );
//             } else {
//               // عرض أفقي للشاشات الكبيرة (Tablet/Desktop)
//               return Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // العمود الأيمن (لأن اللغة عربية)
//                   Expanded(
//                     child: Column(
//                       children: [
//                         _buildContactTitle(
//                           context,
//                           'مدير المبيعات',
//                           screenWidth,
//                         ),
//                         const SizedBox(height: 12),
//                         _buildContactRow(
//                           context,
//                           'م/ عبدالرحمن عبدالصمد',
//                           '01014894756',
//                           screenWidth,
//                         ),
//                       ],
//                     ),

//                   ),
//                   const SizedBox(width: 24),
//                   // العمود الأيسر
//                   Expanded(
//                     child: Column(
//                       children: [
//                         _buildContactTitle(
//                           context,
//                           'رئيس مجلس الادارة',
//                           screenWidth,
//                         ),
//                         const SizedBox(height: 12),
//                         _buildContactRow(
//                           context,
//                           'م/ شريف عامر',
//                           '01005365486',
//                           screenWidth,
//                         ),
//                         const SizedBox(height: 30),
//                         _buildContactTitle(
//                           context,
//                           'المدير المالي',
//                           screenWidth,
//                         ),
//                         const SizedBox(height: 12),
//                         _buildContactRow(
//                           context,
//                           'م/ محمد قرنى',
//                           '01026031424',
//                           screenWidth,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             }
//           },
//         ),
//       ],
//     );
//   }
// }
