// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class _CustomDropdownButtonState extends State<CustomDropdownButton> {
//   late String _selectedDepartment;
//   _CustomDropdownButtonState({this.onChanged});
//   final List<String> _departments = [
//     'CS',
//     'IS',
//     'Front',
//     'Back',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey,
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton<String>(
//           value: _selectedDepartment,
//           onChanged: onChanged,
//           isExpanded: true,
//           icon: Icon(
//             Icons.arrow_drop_down,
//             color: Colors.white,
//           ),
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16.0,
//           ),
//           hint: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Text(
//               'Departments',
//             ),
//           ),
//           items: _departments.map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: SizedBox(
//                 width: double.infinity,
//                 child: Text(
//                   value,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
//
