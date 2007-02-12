From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:35 -0800
Subject: [Buildroot] [buildroot 0001091]: when i try to build buildroot from
	the latest snapshot for arm, arm926t,
	it fails right at the beginning
Message-ID: <80e4fcca0e0a4b8e1078c20a24702561@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1091 
====================================================================== 
Reported By:                mrobefan
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1091
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-15-2006 10:25 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    when i try to build buildroot from the latest
snapshot for arm, arm926t, it fails right at the beginning
Description: 
when i try to build buildroot from the latest snapshot for arm, arm926t, it
fails right at the beginning.
(i tried running it as root as well, no good)

i get:

#
if [ -d "target/device/Sharp/LNode80/target_skeleton" ] ; then \
#
                cp -fa target/device/Sharp/LNode80/target_skeleton/*
/home/shirour/mrobe/buildroot/build_arm/root/; \
#
        fi;
#
cp: target `/home/shirour/mrobe/buildroot/build_arm/root/' is not a
directory: No such file or directory
#
make: *** [/home/shirour/mrobe/buildroot/build_arm/root] Error 1 

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 11-22-06 13:41  
---------------------------------------------------------------------- 
This may be fixed already, please update and report back.
Thanks, 

---------------------------------------------------------------------- 
 bernhardf - 02-04-07 09:16  
---------------------------------------------------------------------- 
Fixed in svn. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-15-06 10:25  mrobefan       New Issue                                    
11-15-06 10:25  mrobefan       Status                   new => assigned     
11-15-06 10:25  mrobefan       Assigned To               => uClibc          
11-22-06 13:41  bernhardf      Note Added: 0001773                          
02-04-07 09:16  bernhardf      Status                   assigned => closed  
02-04-07 09:16  bernhardf      Note Added: 0002110                          
02-04-07 09:16  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
