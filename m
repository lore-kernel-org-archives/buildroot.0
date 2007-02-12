From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:03 -0800
Subject: [Buildroot] [buildroot 0000943]: DHCP Link broken
Message-ID: <909599dd6ace3ca933ea7a6afbacab31@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=943 
====================================================================== 
Reported By:                kfries6
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   943
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-12-2006 09:59 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    DHCP Link broken
Description: 
ISC has moved version 3.0.3 of the DHCP source into a new subdirectory:
   ftp://ftp.isc.org/isc/dhcp/dhcp-3.0-history/

====================================================================== 

---------------------------------------------------------------------- 
 kfries6 - 07-12-06 10:02  
---------------------------------------------------------------------- 
Oops, sorry, missed bug 000911 which this is a dup of 

---------------------------------------------------------------------- 
 bjdooks - 07-13-06 04:02  
---------------------------------------------------------------------- 
The patch dosen't seem to be required for the 3.0.4, and dhclient works
fine without it being there 

---------------------------------------------------------------------- 
 vapier - 07-19-06 16:57  
---------------------------------------------------------------------- 
dupe of 911 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-12-06 09:59  kfries6        New Issue                                    
07-12-06 09:59  kfries6        Status                   new => assigned     
07-12-06 09:59  kfries6        Assigned To               => uClibc          
07-12-06 10:02  kfries6        Note Added: 0001517                          
07-13-06 04:02  bjdooks        Note Added: 0001522                          
07-19-06 16:57  vapier         Note Added: 0001536                          
07-19-06 16:57  vapier         Status                   assigned => closed  
07-19-06 16:57  vapier         Resolution               open => duplicate   
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
