From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:32 -0800
Subject: [Buildroot] [buildroot 0000393]: dhcp client set to non-existent
	version
Message-ID: <09d90a23e50f5e4ea90bbca85e038aa6@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=393 
====================================================================== 
Reported By:                marcusbrutus
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   393
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-20-2005 21:01 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    dhcp client set to non-existent version
Description: 
Build scripts are set to download 3.0.2,
which no longer exists at ftp://ftp.isc.org/isc/dhcp/
Current version is 3.0.3
It it helpful to change version in dhcp.mk to
'latest' so that script retrieves
ftp://ftp.isc.org/isc/dhcp/dhcp-latest.tar.gz
rather than
ftp://ftp.isc.org/isc/dhcp/dhcp-3.0.3.tar.gz ?
====================================================================== 

---------------------------------------------------------------------- 
 marcusbrutus - 08-20-05 21:29  
---------------------------------------------------------------------- 
oops, see bug 0000382 

---------------------------------------------------------------------- 
 vapier - 08-28-05 00:53  
---------------------------------------------------------------------- 
thanks, added to svn 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-20-05 21:01  marcusbrutus   New Issue                                    
08-20-05 21:01  marcusbrutus   Status                   new => assigned     
08-20-05 21:01  marcusbrutus   Assigned To               => uClibc          
08-20-05 21:29  marcusbrutus   Note Added: 0000427                          
08-28-05 00:53  vapier         Note Added: 0000447                          
08-28-05 00:53  vapier         Status                   assigned => closed  
08-28-05 00:53  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
