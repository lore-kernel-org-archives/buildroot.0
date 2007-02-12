From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:04 -0800
Subject: [Buildroot] [buildroot 0000958]: No such file `dhcp-3.0.3.tar.gz'.
Message-ID: <ed4290da6e630e21996b8807b07269a2@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=958 
====================================================================== 
Reported By:                bowerymarc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   958
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-16-2006 22:29 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    No such file `dhcp-3.0.3.tar.gz'.
Description: 
wget --passive-ftp -P /home/tools/buildroot/dl
ftp://ftp.isc.org/isc/dhcp/dhcp-3.0.3.tar.gz
--23:38:30--  ftp://ftp.isc.org/isc/dhcp/dhcp-3.0.3.tar.gz
           => `/home/tools/buildroot/dl/dhcp-3.0.3.tar.gz'
Resolving ftp.isc.org... 204.152.184.110
Connecting to ftp.isc.org[204.152.184.110]:21... connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD /isc/dhcp ... done.
==> PASV ... done.    ==> RETR dhcp-3.0.3.tar.gz ...
No such file `dhcp-3.0.3.tar.gz'.

====================================================================== 

---------------------------------------------------------------------- 
 bjdooks - 07-17-06 01:15  
---------------------------------------------------------------------- 
See http://bugs.uclibc.org/view.php?id=943 and
http://bugs.uclibc.org/view.php?id=911 

---------------------------------------------------------------------- 
 vapier - 07-19-06 16:57  
---------------------------------------------------------------------- 
dupe of 911 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-16-06 22:29  bowerymarc     New Issue                                    
07-16-06 22:29  bowerymarc     Status                   new => assigned     
07-16-06 22:29  bowerymarc     Assigned To               => uClibc          
07-17-06 01:15  bjdooks        Note Added: 0001528                          
07-19-06 16:57  vapier         Note Added: 0001535                          
07-19-06 16:57  vapier         Status                   assigned => closed  
07-19-06 16:57  vapier         Resolution               open => duplicate   
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
