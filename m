From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 20 Mar 2007 09:46:48 -0700
Subject: [Buildroot] [buildroot 0001232]: dialog from
	buildroot-20070218.tar.bz2 will not compile
Message-ID: <144978768e0a15da424089526af61ece@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1232 
====================================================================== 
Reported By:                BLS
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1232
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-18-2007 22:47 PST
Last Modified:              03-20-2007 09:46 PDT
====================================================================== 
Summary:                    dialog from buildroot-20070218.tar.bz2 will not
compile
Description: 
dialog from buildroot-20070218.tar.bz2 will not compile.
It cannot find the ncurses library.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 03-20-07 09:46  
---------------------------------------------------------------------- 
I think that this was fixed already in svn.

Please retest without your patch and let me know if that works now with an
unpatched checkout.
thanks, 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-18-07 22:47  BLS            New Issue                                    
02-18-07 22:47  BLS            Status                   new => assigned     
02-18-07 22:47  BLS            Assigned To               => buildroot       
02-18-07 22:47  BLS            File Added: dialog.patch                     
03-20-07 09:46  bernhardf      Note Added: 0002246                          
======================================================================
