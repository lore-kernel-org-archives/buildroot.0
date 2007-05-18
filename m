From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 18 May 2007 02:59:59 -0700
Subject: [Buildroot] [buildroot 0001353]: dm: wrong path in Makefile
Message-ID: <75ed07159eb8f36450dcd56a8c8164db@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1353 
====================================================================== 
Reported By:                razzor
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1353
Category:                   Other
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             05-18-2007 01:06 PDT
Last Modified:              05-18-2007 02:59 PDT
====================================================================== 
Summary:                    dm: wrong path in Makefile
Description: 
dm upstream package installs the binary to $(STAGEDIR)/usr/sbin, 
but buildroot expect it in $(STAGEDIR)/sbin.

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 05-18-07 02:59  
---------------------------------------------------------------------- 
Fixed in r18651. Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-18-07 01:06  razzor         New Issue                                    
05-18-07 01:06  razzor         Status                   new => assigned     
05-18-07 01:06  razzor         Assigned To               => buildroot       
05-18-07 01:06  razzor         File Added: dm.patch                         
05-18-07 02:59  bernhardf      Status                   assigned => closed  
05-18-07 02:59  bernhardf      Note Added: 0002369                          
======================================================================
