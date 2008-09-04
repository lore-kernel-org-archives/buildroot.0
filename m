From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 3 Sep 2008 18:37:30 -0700
Subject: [Buildroot] [buildroot 0004794]: Add new package eeprog to buildroot
Message-ID: <48117be959fa899d0fcf3e8aabc895d5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=4794 
====================================================================== 
Reported By:                gustavoz
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4794
Category:                   New Features
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             08-29-2008 08:09 PDT
Last Modified:              09-03-2008 18:37 PDT
====================================================================== 
Summary:                    Add new package eeprog to buildroot
Description: 
Add the eeprog (i2c eeprom userland programmer) package to buildroot.

====================================================================== 

---------------------------------------------------------------------- 
 hmoffatt - 09-03-08 18:37  
---------------------------------------------------------------------- 
Thanks, patch applied as r23314.

I modified it slightly - you need to pass CFLAGS="$(TARGET_CFLAGS)" down
to the submake too, else eeprog's Makefile's default CFLAGS are used. 

---------------------------------------------------------------------- 
 hmoffatt - 09-03-08 18:37  
---------------------------------------------------------------------- 
Fixed in r23314 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-29-08 08:09  gustavoz       New Issue                                    
08-29-08 08:09  gustavoz       Status                   new => assigned     
08-29-08 08:09  gustavoz       Assigned To               => buildroot       
08-29-08 08:09  gustavoz       File Added: buildroot-eeprog.patch               
    
09-03-08 18:37  hmoffatt       Note Added: 0010954                          
09-03-08 18:37  hmoffatt       Status                   assigned => closed  
09-03-08 18:37  hmoffatt       Note Added: 0010964                          
======================================================================
