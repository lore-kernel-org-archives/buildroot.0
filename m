From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 21 May 2007 23:24:23 -0700
Subject: [Buildroot] [buildroot 0001364]: Cannot compile DirectFB on ARM
Message-ID: <c2dc89b66528485238f170bd73914c37@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1364 
====================================================================== 
Reported By:                teratronik
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1364
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-21-2007 23:24 PDT
Last Modified:              05-21-2007 23:24 PDT
====================================================================== 
Summary:                    Cannot compile DirectFB on ARM
Description: 
When trying to compile DirectFB, compilation stops because PAGE_SIZE is
undefined.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-21-07 23:24  teratronik     New Issue                                    
05-21-07 23:24  teratronik     Status                   new => assigned     
05-21-07 23:24  teratronik     Assigned To               => buildroot       
05-21-07 23:24  teratronik     File Added: directfb_page_size.patch             
      
======================================================================
