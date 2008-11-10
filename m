From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 10 Nov 2008 09:14:14 -0800
Subject: [Buildroot] [buildroot 0006084]: $HOST system need 'gperf' to
	compile WebKit
Message-ID: <dc676ac71155997d47df73740fd01223@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6084 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6084
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-10-2008 09:14 PST
Last Modified:              11-10-2008 09:14 PST
====================================================================== 
Summary:                    $HOST system need 'gperf' to compile WebKit
Description: 
checking if
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 supports -fvisibility=hidden
-fvisibility-inlines-hidden... yes
checking for perl... /usr/bin/perl
checking for bison... /usr/bin/bison
checking for flex... /usr/bin/flex
checking for gperf... no
configure: error: You need the 'gperf' hash function generator to compile
WebKit
make: ***
[/home/roberto/gles/buildroot/build_i586/webkit-r31321/.stamp_configured]
Error 1

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-10-08 09:14  robang74       New Issue                                    
11-10-08 09:14  robang74       Status                   new => assigned     
11-10-08 09:14  robang74       Assigned To               => buildroot       
======================================================================
