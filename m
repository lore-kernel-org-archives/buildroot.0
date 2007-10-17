From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 16 Oct 2007 22:54:38 -0700
Subject: [Buildroot] [buildroot 0001536]: cp: missing destination file
	operand
Message-ID: <708158cad766dad2fb1c1ed5cf3ef4af@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been DELETED. 
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
Status:                     closed
Resolution:                 no change required
Fixed in Version:           
====================================================================== 
Date Submitted:             10-16-2007 17:43 PDT
Last Modified:              10-16-2007 22:54 PDT
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

---------------------------------------------------------------------- 
 UlfSamuelsson - 10-16-07 22:53  
---------------------------------------------------------------------- 
Need to specify linux .config in make menuconfig
 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-16-07 17:43  Steve Cornett  New Issue                                    
10-16-07 17:43  Steve Cornett  Status                   new => assigned     
10-16-07 17:43  Steve Cornett  Assigned To               => buildroot       
10-16-07 17:43  Steve Cornett  File Added: InputAndOutput.tar                   

10-16-07 18:21  hmoffatt       Note Added: 0002826                          
10-16-07 22:53  UlfSamuelsson  Note Added: 0002827                          
10-16-07 22:53  UlfSamuelsson  Resolution               open => no change
required
10-16-07 22:54  UlfSamuelsson  Status                   assigned => closed  
10-16-07 22:54  UlfSamuelsson  Issue Deleted: 0001536                       
======================================================================
