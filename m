From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 17 Dec 2007 04:31:35 -0800
Subject: [Buildroot] [buildroot 0001634]: Add support for GNU and kernel.org
	mirrors
Message-ID: <e6526e8fd4aa7f9905a124f7ef623b17@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1634 
====================================================================== 
Reported By:                redhatter
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1634
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             12-06-2007 00:42 PST
Last Modified:              12-17-2007 04:31 PST
====================================================================== 
Summary:                    Add support for GNU and kernel.org mirrors
Description: 
Like SourceForge, the GNU.org and kernel.org sites both have their own
system of mirrors across the globe.  The following patch allows the user
to specify their own local mirror in place of the main site.

This is especially useful in universities, where there may be a local
mirror that is unmetered.  (Here in Australia for instance, most
universities allow unmetered downloads from the AARNet mirror.  Very handy
when you're only given a 150MB rolling monthly quota.)

The following is a patch against busybox SVN r20626.
====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 12-17-07 04:31  
---------------------------------------------------------------------- 
implemented in rev 20656 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-06-07 00:42  redhatter      New Issue                                    
12-06-07 00:42  redhatter      Status                   new => assigned     
12-06-07 00:42  redhatter      Assigned To               => buildroot       
12-06-07 00:42  redhatter      File Added: buildroot-add-gnu-kernel-mirror.diff 
                  
12-17-07 04:31  vanokuten      Status                   assigned => closed  
12-17-07 04:31  vanokuten      Note Added: 0003224                          
======================================================================
