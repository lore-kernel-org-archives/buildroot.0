From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:59 -0800
Subject: [Buildroot] [buildroot 0000452]: Updated OpenSSL to version 0.9.8
Message-ID: <8290371b41439cfd484f9ebc0531ff9a@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=452 
====================================================================== 
Reported By:                gnat
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   452
Category:                   New Features
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-29-2005 15:46 PDT
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    Updated OpenSSL to version 0.9.8
Description: 
Updates openssl from 0.9.7e to 0.9.8
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 09-29-05 18:52  
---------------------------------------------------------------------- 
thanks, now in svn 

---------------------------------------------------------------------- 
 gnat - 09-30-05 08:27  
---------------------------------------------------------------------- 
if this patch was applied, please reverse it. There are patches used for
0.9.7e that do not apply cleanly that I need to review. 

---------------------------------------------------------------------- 
 akvadrako - 10-28-05 12:05  
---------------------------------------------------------------------- 
I think your review should show that the patch no longer applies.  openssl
now contains a [no-]fips configure option, and it is disables by default. 
Attached is my patch to upgrade to 0.9.7h.  Notice that the openssl.patch
file needs some changes. 

---------------------------------------------------------------------- 
 bernhardf - 12-22-06 04:44  
---------------------------------------------------------------------- 
what's the status of this report? openssl in svn builds fine for me..

Should we update to the current debian-version? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-29-05 15:46  gnat           New Issue                                    
09-29-05 15:46  gnat           Status                   new => assigned     
09-29-05 15:46  gnat           Assigned To               => uClibc          
09-29-05 18:52  vapier         Note Added: 0000590                          
09-29-05 18:52  vapier         Status                   assigned => resolved
09-29-05 18:52  vapier         Resolution               open => fixed       
09-30-05 08:27  gnat           Status                   resolved => feedback
09-30-05 08:27  gnat           Resolution               fixed => reopened   
09-30-05 08:27  gnat           Note Added: 0000592                          
09-30-05 10:03  schieli        Issue Monitored: schieli                     
10-12-05 08:48  schieli        Issue End Monitor: schieli                    
10-28-05 12:05  akvadrako      Note Added: 0000646                          
10-28-05 12:05  akvadrako      File Added: br-openssl-upgrade.patch             
      
09-14-06 10:06  Scott B        Issue Monitored: Scott B                     
12-22-06 04:44  bernhardf      Note Added: 0001919                          
02-12-07 05:33  vapier         Status                   feedback => assigned
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
