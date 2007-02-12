From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:57 -0800
Subject: [Buildroot] [buildroot 0000150]: new package version provided:
	netsnmp
Message-ID: <1fadca4a21fe0b33d817a90b0e5ba3f1@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=150 
====================================================================== 
Reported By:                clausklein
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   150
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-13-2005 12:46 PST
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    new package version provided: netsnmp
Description: 
update to net-snmp-5.2.1

Bug fixed in old package: It should not always asume little endian for
target!

Patch for new net-snmp feature:
Only if "DEFAULT_SNMP_VERSION=3; SNMPTRAPD_CONTEXT='snmptrapd' used!
In all other cases the empty default context is used by snmptrapd.

This package version is needed for the new quagga package.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-13-05 12:46  clausklein     New Issue                                    
03-13-05 12:46  clausklein     File Added: netsnmp.tgz                      
03-16-05 12:12  andersen       Status                   new => assigned     
03-16-05 12:12  andersen       Assigned To               => uClibc          
01-25-06 06:12  prpplague      Status                   assigned => closed  
01-25-06 06:12  prpplague      Resolution               open => won't fix   
01-25-06 06:12  prpplague      Additional Information Updated                   

02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
