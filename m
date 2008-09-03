From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 3 Sep 2008 08:43:14 -0700
Subject: [Buildroot] [buildroot 0004804]: lzo1x.h not found
Message-ID: <d461c7098297d7918cf72a8f1db5197f@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4804 
====================================================================== 
Reported By:                iceman_im
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4804
Category:                   Other
Reproducibility:            have not tried
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-03-2008 08:43 PDT
Last Modified:              09-03-2008 08:43 PDT
====================================================================== 
Summary:                    lzo1x.h not found
Description: 
I try to make a compilation for arm architecutre for an AT91sam9260EK board
and I have a compilation error in mtd_orig...

Looks like lzo1x.h could not be found but :

# find -name lzo1x.h
./build_arm_wchar/lzo-2.03/include/lzo/lzo1x.h
./build_arm_wchar/staging_dir/usr/include/lzo/lzo1x.h

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-03-08 08:43  iceman_im      New Issue                                    
09-03-08 08:43  iceman_im      Status                   new => assigned     
09-03-08 08:43  iceman_im      Assigned To               => buildroot       
======================================================================
