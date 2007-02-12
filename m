From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:48 -0800
Subject: [Buildroot] [buildroot 0000462]: TCL kills /usr/include
Message-ID: <ae223b8e546953fd37a283181fdabc52@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=462 
====================================================================== 
Reported By:                nathan
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   462
Category:                   Standards Compliance
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-02-2005 20:54 PDT
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    TCL kills /usr/include
Description: 
It took me a while to figure out why nothing on my target archetecture
would compile.  It's the rm -Rf $(TARGET_DIR)/usr/include line in 
package/tcl/tcl.mk  It would be nice to change this command so it only
removes TCL icnludes when requested rather than all the headers for
everything.  (I just commented it out.)
Thanks!
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 11-29-05 19:46  
---------------------------------------------------------------------- 
iirc, i fixed this a little while ago 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-02-05 20:54  nathan         New Issue                                    
10-02-05 20:54  nathan         Status                   new => assigned     
10-02-05 20:54  nathan         Assigned To               => uClibc          
11-29-05 19:46  vapier         Note Added: 0000714                          
11-29-05 19:46  vapier         Status                   assigned => closed  
11-29-05 19:46  vapier         Resolution               open => fixed       
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
