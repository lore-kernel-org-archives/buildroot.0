From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 13 Aug 2007 06:05:27 -0700
Subject: [Buildroot] [buildroot 0001462]: X11R7 fails to build due to error
	in libxcb
Message-ID: <21426912fe58a8a4875cb04be90b4b20@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1462 
====================================================================== 
Reported By:                simpa
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1462
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-13-2007 06:01 PDT
Last Modified:              08-13-2007 06:05 PDT
====================================================================== 
Summary:                    X11R7 fails to build due to error in libxcb
Description: 
Building X11R7 fails while building libxcb with:

xv.c: In function 'xcb_xv_put_image_checked':
xv.c:2870: error: 'data_size' undeclared (first use in this function)
xv.c:2870: error: (Each undeclared identifier is reported only once
xv.c:2870: error: for each function it appears in.)
xv.c: In function 'xcb_xv_put_image':
xv.c:2951: error: 'data_size' undeclared (first use in this function)

====================================================================== 

---------------------------------------------------------------------- 
 simpa - 08-13-07 06:05  
---------------------------------------------------------------------- 
tested with buildroot-snapshot from 08-13-07

With manually added x11r7-patch from Julien it builds... 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-13-07 06:01  simpa          New Issue                                    
08-13-07 06:01  simpa          Status                   new => assigned     
08-13-07 06:01  simpa          Assigned To               => buildroot       
08-13-07 06:05  simpa          Note Added: 0002659                          
======================================================================
