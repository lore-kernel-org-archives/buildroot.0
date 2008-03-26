From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 26 Mar 2008 02:48:50 -0700
Subject: [Buildroot] [buildroot 0002654]: Snapshot downloads ncurses-5.6
	from incorrect location
Message-ID: <5496368cf53930a75a446938589941c9@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=2654 
====================================================================== 
Reported By:                jbruchon
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2654
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 duplicate
Duplicate:                  2634
Fixed in Version:           
====================================================================== 
Date Submitted:             03-23-2008 07:44 PDT
Last Modified:              03-26-2008 02:48 PDT
====================================================================== 
Summary:                    Snapshot downloads ncurses-5.6 from incorrect
location
Description: 
buildroot-snapshot from 2008-03-23 attempted to download ncurses-5.6 from
the GNU mirror, and stopped because the URL had "/pub/gnu/gnu/ncurses"
instead of "/pub/gnu/ncurses".  Downloading manually and placing
ncurses-5.6.tar.gz in the dl/ directory successfully works around the
error.
======================================================================
Relationships       ID      Summary
----------------------------------------------------------------------
duplicate of        0002634 path to ncurses seems to contain extra ...
====================================================================== 

---------------------------------------------------------------------- 
 gnat - 03-24-08 10:12  
---------------------------------------------------------------------- 
the patch above fixes this and other gnu download path software. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-23-08 07:44  jbruchon       New Issue                                    
03-23-08 07:44  jbruchon       Status                   new => assigned     
03-23-08 07:44  jbruchon       Assigned To               => buildroot       
03-24-08 10:12  gnat           File Added: gnu_path.diff                    
03-24-08 10:12  gnat           Note Added: 0005844                          
03-25-08 20:31  hmoffatt       Relationship added       duplicate of 0002634
03-25-08 20:31  hmoffatt       Duplicate ID             0 => 2634           
03-25-08 20:31  hmoffatt       Status                   assigned => resolved
03-25-08 20:31  hmoffatt       Resolution               open => duplicate   
03-26-08 02:48  hmoffatt       Status                   resolved => closed  
======================================================================
