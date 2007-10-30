From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 30 Oct 2007 05:54:06 -0700
Subject: [Buildroot] [buildroot 0001553]: New package : midnight commander
Message-ID: <7e4083d13444713e591de3a8ba3019ee@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1553 
====================================================================== 
Reported By:                Leon Bailly
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1553
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-23-2007 17:32 PDT
Last Modified:              10-30-2007 05:54 PDT
====================================================================== 
Summary:                    New package : midnight commander
Description: 
Midnight Commander 4.6.1 with debian patches.
Requires glib2.0 on buildmachine.

Requires glib2.0 + ncurses on hostmachine.


====================================================================== 

---------------------------------------------------------------------- 
 Leon Bailly - 10-30-07 05:54  
---------------------------------------------------------------------- 
An improved version mc2.tar.gz removes the dependency on ncurses.
You can use the recommended mc-slang library instead.

Further improvements:

- honors LARGEFILE_support setting
- honors HAVE_MANPAGES
- selectable NLS
- selectable VFS
- a space saving feature removes some hi-lite template files 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-23-07 17:32  Leon Bailly    New Issue                                    
10-23-07 17:32  Leon Bailly    Status                   new => assigned     
10-23-07 17:32  Leon Bailly    Assigned To               => buildroot       
10-23-07 17:32  Leon Bailly    File Added: mc.tar.gz                        
10-23-07 17:32  Leon Bailly    Issue Monitored: Leon Bailly                    
10-30-07 05:42  Leon Bailly    File Added: mc2.tar.gz                       
10-30-07 05:54  Leon Bailly    Note Added: 0002870                          
======================================================================
