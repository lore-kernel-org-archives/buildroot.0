From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 20 Mar 2007 10:27:29 -0700
Subject: [Buildroot] [buildroot 0000520]: gettext: seperate host and target
	installs
Message-ID: <678b7a8063fa4bc7ba3844e9ebad3c73@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             10-28-2005 09:49 PDT
Last Modified:              03-20-2007 10:27 PDT
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

---------------------------------------------------------------------- 
 bernhardf - 03-20-07 10:27  
---------------------------------------------------------------------- 
I don't see a relation, still closing upon request. 

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
03-20-07 10:27  bernhardf      Status                   assigned => closed  
03-20-07 10:27  bernhardf      Note Added: 0002252                          
======================================================================
