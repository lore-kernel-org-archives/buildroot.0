From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 13 Mar 2008 19:01:43 -0700
Subject: [Buildroot] [buildroot 0002574]: Tell SVN to ignore ".auto.deps"
Message-ID: <8049ffdc16522e47fa926fe236dcb0d0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2574 
====================================================================== 
Reported By:                mth
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2574
Category:                   Other
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-13-2008 19:01 PDT
Last Modified:              03-13-2008 19:01 PDT
====================================================================== 
Summary:                    Tell SVN to ignore ".auto.deps"
Description: 
The file ".auto.deps" is automatically generated, but it is not in the
svn:ignore property of the top-level dir, so it pollutes the "svn st"
output. Please add it to the ignore list.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-13-08 19:01  mth            New Issue                                    
03-13-08 19:01  mth            Status                   new => assigned     
03-13-08 19:01  mth            Assigned To               => buildroot       
======================================================================
