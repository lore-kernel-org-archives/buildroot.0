From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 1 Mar 2008 14:24:04 -0800
Subject: [Buildroot] [buildroot 0002374]: u-boot ftp address at atmel is
	false
Message-ID: <d99ef3f2aa03ff87584c637dbb9a8eb0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2374 
====================================================================== 
Reported By:                JNAvila
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2374
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-28-2008 03:03 PST
Last Modified:              03-01-2008 14:24 PST
====================================================================== 
Summary:                    u-boot ftp address at atmel is false
Description: 
The generated ftp address is false when selecting U-boot 
====================================================================== 

---------------------------------------------------------------------- 
 jcdr - 03-01-08 14:24  
---------------------------------------------------------------------- 
I have see the exact same problem and used the exact same patch to solve
it.
Please apply. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-28-08 03:03  JNAvila        New Issue                                    
02-28-08 03:03  JNAvila        Status                   new => assigned     
02-28-08 03:03  JNAvila        Assigned To               => buildroot       
02-28-08 03:03  JNAvila        File Added: u-boot-address.patch                 
  
03-01-08 14:24  jcdr           Note Added: 0005564                          
======================================================================
