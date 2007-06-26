From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 26 Jun 2007 08:41:19 -0700
Subject: [Buildroot] [buildroot 0001029]: SNTP doesn't work - update ntp to
	newer version
Message-ID: <1f22a399f40e49ab064df362d866fc9e@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             09-14-2006 10:15 PDT
Last Modified:              06-26-2007 08:41 PDT
====================================================================== 
Summary:                    SNTP doesn't work - update ntp to newer version
Description: 
This patch changes the NTP version from ntp-4.2.0 to ntp-4.2.2p3. Version
4.2.0
doesn't appear to properly support SNTP. Note that this patch also
removes
the "ntp-cross-compile.patch".

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 06-26-07 08:41  
---------------------------------------------------------------------- 
Fixed in r18940 

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
06-26-07 08:39  bernhardf      Relationship deleted     duplicate of 0000666
06-26-07 08:41  bernhardf      Status                   assigned => closed  
06-26-07 08:41  bernhardf      Note Added: 0002524                          
======================================================================
