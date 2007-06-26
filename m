From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 26 Jun 2007 07:10:30 -0700
Subject: [Buildroot] [buildroot 0001029]: SNTP doesn't work - update ntp to
	newer version
Message-ID: <c0f036bcb4f012eb5ea2dbf599ad01fb@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been set as DUPLICATE OF issue 0000666. 
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
Last Modified:              06-26-2007 07:10 PDT
====================================================================== 
Summary:                    SNTP doesn't work - update ntp to newer version
Description: 
This patch changes the NTP version from ntp-4.2.0 to ntp-4.2.2p3. Version
4.2.0
doesn't appear to properly support SNTP. Note that this patch also
removes
the "ntp-cross-compile.patch".

======================================================================
Relationships       ID      Summary
----------------------------------------------------------------------
duplicate of        0000666 openntpd init script and version bump
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
06-26-07 07:10  bernhardf      Relationship added       duplicate of 0000666
======================================================================
