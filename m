From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 16 Oct 2007 18:21:04 -0700
Subject: [Buildroot] [buildroot 0001536]: cp: missing destination file
	operand
Message-ID: <4e238a1158c51a8876df60f82ee06313@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1536 
====================================================================== 
Reported By:                Steve Cornett
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1536
Category:                   Other
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-16-2007 17:43 PDT
Last Modified:              10-16-2007 18:21 PDT
====================================================================== 
Summary:                    cp: missing destination file operand
Description: 
After configuring for arm, with all other default options, make ends with:

cp -dpf 
/home/test/buildroot/project_build_arm/uclibc/linux-2.6.22.10/.config
cp: missing destination file operand after
`/home/test/buildroot/project_build_arm/uclibc/linux-2.6.22.10/.config'
Try `cp --help' for more information.
make: ***
[/home/test/buildroot/project_build_arm/uclibc/linux-2.6.22.10/.configured]
Error 1
====================================================================== 

---------------------------------------------------------------------- 
 hmoffatt - 10-16-07 18:21  
---------------------------------------------------------------------- 
This means you didn't specify a configuration file for the kernel. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-16-07 17:43  Steve Cornett  New Issue                                    
10-16-07 17:43  Steve Cornett  Status                   new => assigned     
10-16-07 17:43  Steve Cornett  Assigned To               => buildroot       
10-16-07 17:43  Steve Cornett  File Added: InputAndOutput.tar                   

10-16-07 18:21  hmoffatt       Note Added: 0002826                          
======================================================================
