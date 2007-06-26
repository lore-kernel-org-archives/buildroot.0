From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 26 Jun 2007 06:50:47 -0700
Subject: [Buildroot] [buildroot 0001405]: ARM OABI builds fail for gcc 4.x
Message-ID: <89c9717b681471690bf553eee0232c81@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1405 
====================================================================== 
Reported By:                bjdooks
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1405
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-26-2007 06:50 PDT
Last Modified:              06-26-2007 06:50 PDT
====================================================================== 
Summary:                    ARM OABI builds fail for gcc 4.x
Description: 
ARM OABI configured builds cannot produce working gcc output due to missing
items in libgcc. 
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-26-07 06:50  bjdooks        New Issue                                    
06-26-07 06:50  bjdooks        Status                   new => assigned     
06-26-07 06:50  bjdooks        Assigned To               => buildroot       
06-26-07 06:50  bjdooks        File Added: buildroot-gcc-412-oabi.build         
          
======================================================================
