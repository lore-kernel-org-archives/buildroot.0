From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:51:17 -0800
Subject: [Buildroot] [buildroot 0000084]: gcc 3.4.3 fail compiling dhcp-3.0.1
Message-ID: <9086f2fb46d47b6dcef598af5c30d456@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=84 
====================================================================== 
Reported By:                rickb
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   84
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-04-2005 09:32 PST
Last Modified:              02-12-2007 05:51 PST
====================================================================== 
Summary:                    gcc 3.4.3 fail compiling dhcp-3.0.1
Description: 
it seems a bug of gcc(http://gcc.gnu.org/bugzilla/show_bug.cgi?id=18282),
later versions from cvs are fixed. This patch is derived from the cvs
version contained in the FC3 src.rpm
(http://rpmfind.net//linux/RPM/fedora/development/src/gcc-3.4.3-17.src.html),
this rpm contains many other patches, someone more skilled should check
them..
The patch is really big, how to send?
ciao
Ric

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 03-20-05 18:41  
---------------------------------------------------------------------- 
dhcp-3.0.2 + gcc-3.4.3 builds fine 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-04-05 09:32  rickb          New Issue                                    
03-16-05 12:14  andersen       Status                   new => assigned     
03-16-05 12:14  andersen       Assigned To               => uClibc          
03-20-05 18:41  vapier         Status                   assigned => resolved
03-20-05 18:41  vapier         Resolution               open => won't fix   
03-20-05 18:41  vapier         Note Added: 0000110                          
03-20-05 18:55  vapier         Status                   resolved => closed  
02-12-07 05:51  vapier         Status                   closed => assigned  
02-12-07 05:51  vapier         Assigned To              uClibc => buildroot 
======================================================================
