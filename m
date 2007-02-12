From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:33 -0800
Subject: [Buildroot] [buildroot 0000838]: New package: cryptsetup and
	suppporting library popt
Message-ID: <3588f617b56ef5b21f2f27572c75c6a6@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=838 
====================================================================== 
Reported By:                toidinamai
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   838
Category:                   New Features
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-14-2006 14:02 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    New package: cryptsetup and suppporting library popt
Description: 
cryptsetup is a tool for creating dm-crypt mappings. dm-crypt provides
transparent encryption of block devices using the new Linux 2.6 cryptoapi.
====================================================================== 

---------------------------------------------------------------------- 
 toidinamai - 04-15-06 06:23  
---------------------------------------------------------------------- 
New patch, former one resulted in an unusable cryptsetup binary because
libdevmapper was missing. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-14-06 14:02  toidinamai     New Issue                                    
04-14-06 14:02  toidinamai     Status                   new => assigned     
04-14-06 14:02  toidinamai     Assigned To               => uClibc          
04-14-06 14:02  toidinamai     File Added: buildroot-cryptsetup.patch           
        
04-15-06 06:22  toidinamai     Issue Monitored: toidinamai                    
04-15-06 06:23  toidinamai     File Added: buildroot-cryptsetup-2.patch         
          
04-15-06 06:23  toidinamai     Note Added: 0001298                          
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
