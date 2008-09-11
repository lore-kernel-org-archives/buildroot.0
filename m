From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 11 Sep 2008 05:47:34 -0700
Subject: [Buildroot] [buildroot 0004924]: missing makeinfo
Message-ID: <6e3ffdd3887fc08037e62464d3371ab4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4924 
====================================================================== 
Reported By:                maleadt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4924
Category:                   Architecture Specific
Reproducibility:            sometimes
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-11-2008 05:47 PDT
Last Modified:              09-11-2008 05:47 PDT
====================================================================== 
Summary:                    missing makeinfo
Description: 
When configuring buildroot, it checks for availability of some essential
binaries (bison, flex, ...). makeinfo does turn up in that list (I see it
passing on the terminal when compiling), but buildroot does not halt when
makeinfo seems to be missing. It gets noted (makeinfo availible: NO), but
the build does not halt.

This causes the compilation to fail in a later stage. The only solution
then is to install makeinfo, and completely delete the build. As this
failure (on my system) got triggered after 1 hour of compiling, a lot of
valuable time gets wasted.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-11-08 05:47  maleadt        New Issue                                    
09-11-08 05:47  maleadt        Status                   new => assigned     
09-11-08 05:47  maleadt        Assigned To               => buildroot       
======================================================================
