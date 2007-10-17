From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 16 Oct 2007 17:43:27 -0700
Subject: [Buildroot] [buildroot 0001536]: cp: missing destination file
	operand
Message-ID: <731069d7304aa220e959208fdee10d8d@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Last Modified:              10-16-2007 17:43 PDT
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-16-07 17:43  Steve Cornett  New Issue                                    
10-16-07 17:43  Steve Cornett  Status                   new => assigned     
10-16-07 17:43  Steve Cornett  Assigned To               => buildroot       
10-16-07 17:43  Steve Cornett  File Added: InputAndOutput.tar                   

======================================================================
