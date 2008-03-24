From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 24 Mar 2008 10:12:21 -0700
Subject: [Buildroot] [buildroot 0002654]: Snapshot downloads ncurses-5.6
	from incorrect location
Message-ID: <974af305129668155b892b8c1e9a2de0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             03-23-2008 07:44 PDT
Last Modified:              03-24-2008 10:12 PDT
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
======================================================================
