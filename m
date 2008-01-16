From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 15 Jan 2008 23:24:54 -0800
Subject: [Buildroot] [buildroot 0001934]: readline package can't install
	shared library without headers into target
Message-ID: <ccc042adcaae44c4e45a08d3401e9115@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1934 
====================================================================== 
Reported By:                hmoffatt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1934
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-15-2008 23:24 PST
Last Modified:              01-15-2008 23:24 PST
====================================================================== 
Summary:                    readline package can't install shared library
without headers into target
Description: 
If BR2_READLINE is enabled readline is only installed for the host.

If BR2_PACKAGE_READLINE_TARGET is enabled, both the shared library and
also the header files and info documentation are installed onto the
target.

It would be useful to be able to install just the shared library, so that
it can be used by other applications.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-15-08 23:24  hmoffatt       New Issue                                    
01-15-08 23:24  hmoffatt       Status                   new => assigned     
01-15-08 23:24  hmoffatt       Assigned To               => buildroot       
======================================================================
