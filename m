From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 19:55:12 -0800
Subject: [Buildroot] [buildroot 0001211]: PATCH: Incomplete configuration
	for uClibc when locale support selected
Message-ID: <c5ebecece9e87e58af40329e11b5815b@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1211 
====================================================================== 
Reported By:                foogod
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1211
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-12-2007 19:55 PST
Last Modified:              02-12-2007 19:55 PST
====================================================================== 
Summary:                    PATCH: Incomplete configuration for uClibc when
locale support selected
Description: 
If the configuration option "Enable locale/gettext/i18n support?" is
selected, the uClibc build scripts do not configure all of the necessary
options for uClibc, resulting in the user being prompted for configuration
during the compile.

The attached patch (against 17872) fixes this issue.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-12-07 19:55  foogod         New Issue                                    
02-12-07 19:55  foogod         Status                   new => assigned     
02-12-07 19:55  foogod         Assigned To               => buildroot       
02-12-07 19:55  foogod         File Added:
buildroot.17872.uclibc_gettext_conf.patch                    
======================================================================
