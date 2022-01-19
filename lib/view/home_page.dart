import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController commentController = TextEditingController();

   // List of comment
  var comments = [
    //{"comment": "Hello", "createdTime": "2022-01-10 22:10:11.348"},
   // {"comment": "Hey", "createdTime": "2022-01-10 22:10:11.348"}
  ];

  //Function to add new comment
  void addNewComment(comment) {
    comments.add(comment);
    setState(() {});
  }

  //Function to delete the already existing comment

  void deleteComment(index) {
    comments.removeAt(index);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: const Icon(
          Icons.account_circle
        ),
        title: Text(
          "My Profile",
          
          style: GoogleFonts.poppins(
           //fontWeight: FontWeight.w700,
          
          ),
        ),
        //centerTitle: true,
      ),
      body:Stack(
        children: [
          Container(
              child: Container(
                width: double.infinity,
                height: 500.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        "Joyline Claudia Machado",
                        style: GoogleFonts.poppins(
                          fontSize: 22.0,
                          fontWeight: FontWeight. bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      // CircleAvatar(
                      //   backgroundImage: NetworkImage('https://github.com/JoylineClaudia/JOYLINE/blob/56ff5079148412d3c5f3450f34fe37514c1504ea/female.png'),
                       
                      //   radius: 60.0,
                      // ),

                      Center(
                        heightFactor: 1.5,
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size:const  Size.fromRadius(60),
                            child: Image.network('joyline.png',
                            fit: BoxFit.cover,
                            ),
                          ),
                         ),
                      ),
                       const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Name : Joyline Claudia Machado",
                        style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Email : joylinecmachado@gmail.com",
                        style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "USN : 4MT20CS400",
                        style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Age : 21",
                        style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),

                    ],
                  ),
                ),
              )
              
              
          ),
         
          const SizedBox(
            height: 20.0,
          ),
          

          (comments.isNotEmpty)
              ? ListView.builder(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 90.0),
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            comments[index]["comment"].toString(),
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              deleteComment(index);
                            },
                            icon: const Icon(
                              Icons.delete_outlined,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
         
                :Center (
                    child: Text(
                      //enter the comment
                      "",
                      style: GoogleFonts.poppins(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
           
          Positioned(
            bottom: 0,
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade300.withOpacity(0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.76,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        controller: commentController,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 20.0),
                            hintText: ' Enter the comments',
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.black,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (commentController.text.isNotEmpty) {
                          addNewComment({
                            "comment": commentController.text,
                            "createdTime": DateTime.now().toString()
                          });
                          commentController.text = "";
                        }
                      },
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
       


        ],
      ),
    );
  }
  


  



}
