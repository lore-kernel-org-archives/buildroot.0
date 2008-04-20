From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 20 Apr 2008 01:31:22 -0700
Subject: [Buildroot] [buildroot 0002954]: package cgicc no longer available
	from author site, source and build fails
Message-ID: <79d65ad2e9c34c1d9fe794ef3e7adbaa@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2954 
====================================================================== 
Reported By:                Jean-Baptiste Maillet
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2954
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-20-2008 01:31 PDT
Last Modified:              04-20-2008 01:31 PDT
====================================================================== 
Summary:                    package cgicc no longer available from author site,
source and build fails
Description: 
make libcgicc
...
wget --passive-ftp -nd  -P /var/p2p/jbm/sandbox/buildroot/../download
http://www.cgicc.org/files/cgicc-3.2.3.tar.bz2
--2008-04-20 08:16:03--  http://www.cgicc.org/files/cgicc-3.2.3.tar.bz2
Resolving www.cgicc.org... 66.39.154.96
Connecting to www.cgicc.org|66.39.154.96|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2008-04-20 08:16:04 ERROR 404: Not Found.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-20-08 01:31  Jean-Baptiste MailletNew Issue                                  
 
04-20-08 01:31  Jean-Baptiste MailletStatus                   new => assigned   
 
04-20-08 01:31  Jean-Baptiste MailletAssigned To               => buildroot     
 
04-20-08 01:31  Jean-Baptiste MailletFile Added: libcgicc.patch                 
  
======================================================================
