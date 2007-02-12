From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:18 -0800
Subject: [Buildroot] [buildroot 0000520]: gettext: seperate host and target
	installs
Message-ID: <44bf430f10ca93bd0ab2b7901c214619@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=520 
====================================================================== 
Reported By:                akvadrako
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   520
Category:                   Other
Reproducibility:            N/A
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-28-2005 09:49 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    gettext: seperate host and target installs
Description: 
Currently it's only possible to install the complete gettext on the target.
 this patch allows that with a new configure option, but it changes the
LIBINTL option to only install that needed at runtime for gettext
programs.  This is probably what most people want, not usually doing
development on a buildroot target.
====================================================================== 

---------------------------------------------------------------------- 
 akvadrako - 10-28-05 09:51  
---------------------------------------------------------------------- 
Sorry about the duplicate - please delete me 

---------------------------------------------------------------------- 
 prpplague - 05-24-06 07:54  
---------------------------------------------------------------------- 
duplicate case 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-05 09:49  akvadrako      New Issue                                    
10-28-05 09:49  akvadrako      Status                   new => assigned     
10-28-05 09:49  akvadrako      Assigned To               => uClibc          
10-28-05 09:51  akvadrako      Note Added: 0000645                          
05-24-06 07:54  prpplague      Note Added: 0001378                          
05-24-06 07:54  prpplague      Status                   assigned => closed  
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
