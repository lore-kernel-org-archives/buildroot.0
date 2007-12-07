From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 7 Dec 2007 02:52:44 -0800
Subject: [Buildroot] [buildroot 0001654]: Busybox config path point to "/"
Message-ID: <b1e9a98e629ed7f5dce7272107ca9b21@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1654 
====================================================================== 
Reported By:                jholzmayr
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1654
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-07-2007 02:52 PST
Last Modified:              12-07-2007 02:52 PST
====================================================================== 
Summary:                    Busybox config path point to "/"
Description: 
when using buildroot with busybox 1.7.2, the build of busybox always tries
to find "busybox-1.7.2.config" in the rootfolder. buildroot's config seems
to be ignored.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-07-07 02:52  jholzmayr      New Issue                                    
12-07-07 02:52  jholzmayr      Status                   new => assigned     
12-07-07 02:52  jholzmayr      Assigned To               => buildroot       
======================================================================
