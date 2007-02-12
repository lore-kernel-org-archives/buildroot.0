From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:34:14 -0800
Subject: [Buildroot] [buildroot 0001029]: SNTP doesn't work - update ntp to
	newer version
Message-ID: <15b02aaf579f80995ac4b1df18c0db1a@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1029 
====================================================================== 
Reported By:                Scott B
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1029
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-14-2006 10:15 PDT
Last Modified:              02-12-2007 05:34 PST
====================================================================== 
Summary:                    SNTP doesn't work - update ntp to newer version
Description: 
This patch changes the NTP version from ntp-4.2.0 to ntp-4.2.2p3. Version
4.2.0
doesn't appear to properly support SNTP. Note that this patch also
removes
the "ntp-cross-compile.patch".

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-14-06 10:15  Scott B        New Issue                                    
09-14-06 10:15  Scott B        Status                   new => assigned     
09-14-06 10:15  Scott B        Assigned To               => uClibc          
09-14-06 10:15  Scott B        File Added: 0300-SNTP.patch                    
09-14-06 10:16  Scott B        Issue Monitored: Scott B                     
02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
======================================================================
