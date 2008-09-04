From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 4 Sep 2008 08:25:46 -0700
Subject: [Buildroot] [buildroot 0004804]: lzo1x.h not found
Message-ID: <49d48bc3ed3b93d6bc656e33a4cf3fc3@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been REOPENED. 
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
Status:                     feedback
====================================================================== 
Date Submitted:             09-03-2008 08:43 PDT
Last Modified:              09-04-2008 08:25 PDT
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

---------------------------------------------------------------------- 
 hmoffatt - 09-03-08 18:40  
---------------------------------------------------------------------- 
Fixed in r23315.. thanks

Please consider sending compile error logs in English (eg set LANG=C
before compiling). Thanks 

---------------------------------------------------------------------- 
 iceman_im - 09-04-08 08:25  
---------------------------------------------------------------------- 
Sorry for the french error log, next time it will be in english.
Thanks for the fix but I allready have the same problem...

In fact the build works find for an ext2 file system but crashed for a
jffs2 one... 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-03-08 08:43  iceman_im      New Issue                                    
09-03-08 08:43  iceman_im      Status                   new => assigned     
09-03-08 08:43  iceman_im      Assigned To               => buildroot       
09-03-08 18:40  hmoffatt       Status                   assigned => closed  
09-03-08 18:40  hmoffatt       Note Added: 0010974                          
09-03-08 18:40  hmoffatt       Resolution               open => fixed       
09-04-08 08:21  iceman_im      Issue Monitored: iceman_im                    
09-04-08 08:22  iceman_im      Issue End Monitor: iceman_im                    
09-04-08 08:25  iceman_im      Status                   closed => feedback  
09-04-08 08:25  iceman_im      Resolution               fixed => reopened   
09-04-08 08:25  iceman_im      Note Added: 0011004                          
======================================================================
