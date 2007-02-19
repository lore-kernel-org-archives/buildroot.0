From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 19 Feb 2007 05:58:23 -0800
Subject: [Buildroot] [buildroot 0001233]: Incorrect freetype-config being
	used.
Message-ID: <9867a18bc1e77545591225a4467bbb76@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1233 
====================================================================== 
Reported By:                djl197
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1233
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-19-2007 05:58 PST
Last Modified:              02-19-2007 05:58 PST
====================================================================== 
Summary:                    Incorrect freetype-config being used.
Description: 
The Incorrect freetype-config is being used.  This is because
freetype-config is located in $(STAGING_DIR)/usr/bin this is not included
in the target path.
This means some packages (like directfb) use freetype-config they can find
which is the Host (Build PC)
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-19-07 05:58  djl197         New Issue                                    
02-19-07 05:58  djl197         Status                   new => assigned     
02-19-07 05:58  djl197         Assigned To               => buildroot       
02-19-07 05:58  djl197         File Added: freetype-config.patch                
   
======================================================================
