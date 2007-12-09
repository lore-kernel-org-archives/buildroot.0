From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 8 Dec 2007 19:47:13 -0800
Subject: [Buildroot] [buildroot 0001679]: LUA don't appears like a disabled
	option
Message-ID: <881ef042dd87a69a9d94877862bd7fd8@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1679 
====================================================================== 
Reported By:                sushisan
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1679
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-08-2007 19:47 PST
Last Modified:              12-08-2007 19:47 PST
====================================================================== 
Summary:                    LUA don't appears like a disabled option
Description: 
If ncurses AND readline are setted lua don't appear like an option
disabled, is impossible to know this package exist if the depends are no
setted ( comment "lua            - disabled (requires readline and
ncurses)" don't are printed)
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-08-07 19:47  sushisan       New Issue                                    
12-08-07 19:47  sushisan       Status                   new => assigned     
12-08-07 19:47  sushisan       Assigned To               => buildroot       
12-08-07 19:47  sushisan       File Added: br2-lua.patch                    
======================================================================
