From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 10 Apr 2007 04:05:45 -0700
Subject: [Buildroot] [buildroot 0001232]: dialog from
	buildroot-20070218.tar.bz2 will not compile
Message-ID: <9ae99db866387c6232b98a0f8aef37af@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             02-18-2007 22:47 PST
Last Modified:              04-10-2007 04:05 PDT
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

---------------------------------------------------------------------- 
 bernhardf - 04-10-07 04:05  
---------------------------------------------------------------------- 
Should be fixed in svn. Closing. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-18-07 22:47  BLS            New Issue                                    
02-18-07 22:47  BLS            Status                   new => assigned     
02-18-07 22:47  BLS            Assigned To               => buildroot       
02-18-07 22:47  BLS            File Added: dialog.patch                     
03-20-07 09:46  bernhardf      Note Added: 0002246                          
04-10-07 04:05  bernhardf      Status                   assigned => closed  
04-10-07 04:05  bernhardf      Note Added: 0002305                          
======================================================================
