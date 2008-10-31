From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 31 Oct 2008 02:07:19 -0700
Subject: [Buildroot] [buildroot 0001364]: Cannot compile DirectFB on ARM
Message-ID: <d0350b4c27cc66307d722b7dc6b986dc@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Last Modified:              10-31-2008 02:07 PDT
====================================================================== 
Summary:                    Cannot compile DirectFB on ARM
Description: 
When trying to compile DirectFB, compilation stops because PAGE_SIZE is
undefined.
====================================================================== 

---------------------------------------------------------------------- 
 tpetazzoni - 10-31-08 02:07  
---------------------------------------------------------------------- 
This problem is fixed in recent versions of DirectFB, used by default in
Buildroot. This can be closed. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-21-07 23:24  teratronik     New Issue                                    
05-21-07 23:24  teratronik     Status                   new => assigned     
05-21-07 23:24  teratronik     Assigned To               => buildroot       
05-21-07 23:24  teratronik     File Added: directfb_page_size.patch             
      
05-21-07 23:24  teratronik     Issue Monitored: teratronik                    
10-31-08 02:07  tpetazzoni     Note Added: 0014744                          
======================================================================
