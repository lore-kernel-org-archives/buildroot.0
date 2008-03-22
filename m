From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 22 Mar 2008 09:42:34 -0700
Subject: [Buildroot] [buildroot 0002634]: path to ncurses seems to contain
	extra 'gnu/'
Message-ID: <70451397bfd92cda3ec58eaf59f796c7@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2634 
====================================================================== 
Reported By:                travishein
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2634
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-22-2008 09:42 PDT
Last Modified:              03-22-2008 09:42 PDT
====================================================================== 
Summary:                    path to ncurses seems to contain extra 'gnu/'
Description: 
The value of the variable $(BR2_GNU_MIRROR) seems to contain the /gnu/ path
component, so in the package/ncurses/ncurses.mk where it includes
gnu/ncurses again it is not finding it
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-22-08 09:42  travishein     New Issue                                    
03-22-08 09:42  travishein     Status                   new => assigned     
03-22-08 09:42  travishein     Assigned To               => buildroot       
03-22-08 09:42  travishein     File Added: ncurses_path_20080321.diff           
        
======================================================================
