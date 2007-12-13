From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 13 Dec 2007 04:22:53 -0800
Subject: [Buildroot] [buildroot 0001754]: stunnel don't see OpenSSL
Message-ID: <f2431c4536766c89412b453d395090f1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1754 
====================================================================== 
Reported By:                sushisan
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1754
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             12-12-2007 20:18 PST
Last Modified:              12-13-2007 04:22 PST
====================================================================== 
Summary:                    stunnel don't see OpenSSL
Description: 
openssl library are not in $(STAGING_DIR) but in $(STAGING_DIR)/usr/
====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 12-13-07 04:22  
---------------------------------------------------------------------- 
fixed in 20648 rev 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-12-07 20:18  sushisan       New Issue                                    
12-12-07 20:18  sushisan       Status                   new => assigned     
12-12-07 20:18  sushisan       Assigned To               => buildroot       
12-12-07 20:18  sushisan       File Added: br2-stunnel.patch                    
12-13-07 04:22  vanokuten      Status                   assigned => closed  
12-13-07 04:22  vanokuten      Note Added: 0003154                          
======================================================================
