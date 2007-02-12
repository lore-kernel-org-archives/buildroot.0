From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:55 -0800
Subject: [Buildroot] [buildroot 0000514]: generic target device table: add
	/dev/udb[ab]
Message-ID: <3570236fe247d7087947f8c7d12496c9@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=514 
====================================================================== 
Reported By:                akvadrako
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   514
Category:                   Other
Reproducibility:            N/A
Severity:                   tweak
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-28-2005 09:36 PDT
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    generic target device table: add /dev/udb[ab]
Description: 
As long as buildroot as the philosophy of including any device under the
sun, these are truly useful.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 10-28-05 23:49  
---------------------------------------------------------------------- 
we comment all the devices under the sun, but we dont enable them by
default

udb is already in there and commented so anyone who wants to use it can
just uncomment the lines 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-05 09:36  akvadrako      New Issue                                    
10-28-05 09:36  akvadrako      Status                   new => assigned     
10-28-05 09:36  akvadrako      Assigned To               => uClibc          
10-28-05 09:36  akvadrako      File Added: br-generic-devicetable-fixes.patch   
                
10-28-05 23:49  vapier         Note Added: 0000647                          
10-28-05 23:49  vapier         Status                   assigned => closed  
10-28-05 23:49  vapier         Resolution               open => won't fix   
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
