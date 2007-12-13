From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 12 Dec 2007 20:18:56 -0800
Subject: [Buildroot] [buildroot 0001754]: stunnel don't see OpenSSL
Message-ID: <1b70b2644b5a538248ad2d6f36aa3e2b@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             12-12-2007 20:18 PST
Last Modified:              12-12-2007 20:18 PST
====================================================================== 
Summary:                    stunnel don't see OpenSSL
Description: 
openssl library are not in $(STAGING_DIR) but in $(STAGING_DIR)/usr/
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-12-07 20:18  sushisan       New Issue                                    
12-12-07 20:18  sushisan       Status                   new => assigned     
12-12-07 20:18  sushisan       Assigned To               => buildroot       
12-12-07 20:18  sushisan       File Added: br2-stunnel.patch                    
======================================================================
