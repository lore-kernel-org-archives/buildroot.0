From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 19 Mar 2007 02:11:43 -0700
Subject: [Buildroot] [buildroot 0001277]: LINUX_VERSION refrences itself
Message-ID: <df6fe6a684037b49e449835e01e76fe7@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1277 
====================================================================== 
Reported By:                nevr
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1277
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-19-2007 02:11 PDT
Last Modified:              03-19-2007 02:11 PDT
====================================================================== 
Summary:                    LINUX_VERSION refrences itself
Description: 
in target/linux26.mk:44 LINUX_VERSION is set to equal to $(LINUX_VERSION)
make errors out with recursion errors.  Not sure what it should be set to,
still trying to understand all the internals of buildroot, so no patch
posted, hopefully someone else will be able to figure it out.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-19-07 02:11  nevr           New Issue                                    
03-19-07 02:11  nevr           Status                   new => assigned     
03-19-07 02:11  nevr           Assigned To               => buildroot       
======================================================================
