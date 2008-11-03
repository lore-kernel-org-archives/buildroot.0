From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 3 Nov 2008 04:22:08 -0800
Subject: [Buildroot] [buildroot 0001364]: Cannot compile DirectFB on ARM
Message-ID: <c39190d494d87652ce267410d07a1eec@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             05-21-2007 23:24 PDT
Last Modified:              11-03-2008 04:22 PST
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

---------------------------------------------------------------------- 
 Correa - 11-03-08 04:22  
---------------------------------------------------------------------- 
Fixed in recent versions of DirectFB. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-21-07 23:24  teratronik     New Issue                                    
05-21-07 23:24  teratronik     Status                   new => assigned     
05-21-07 23:24  teratronik     Assigned To               => buildroot       
05-21-07 23:24  teratronik     File Added: directfb_page_size.patch             
      
05-21-07 23:24  teratronik     Issue Monitored: teratronik                    
10-31-08 02:07  tpetazzoni     Note Added: 0014744                          
11-03-08 04:22  Correa         Status                   assigned => closed  
11-03-08 04:22  Correa         Note Added: 0014944                          
======================================================================
