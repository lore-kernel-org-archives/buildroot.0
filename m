From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:20 -0800
Subject: [Buildroot] [buildroot 0000302]: When compile buildroot on woody I
	need ntpdate
Message-ID: <4d61abdf3fde93cbce76eac12da9027e@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=302 
====================================================================== 
Reported By:                marvin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   302
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-17-2005 11:07 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    When compile buildroot on woody I need ntpdate
Description: 
Entering directory `/mnt/film2/ARM/buildroot/build_arm/ntp-4.1.1/libntp'
source='a_md5encrypt.c' object='a_md5encrypt.o' libtool=no \
depfile='.deps/a_md5encrypt.Po' tmpdepfile='.deps/a_md5encrypt.TPo' \
depmode=gcc3 /bin/sh ../depcomp \
/mnt/film2/ARM/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc
-DHAVE_CONFIG_H -I. -I. -I.. -I../include -I../librsaref    -Os -pipe 
-Wall -Wcast-qual -Wmissing-prototypes -Wpointer-arith -Wshadow
-Wstrict-prototypes -pipe -c `test -f a_md5encrypt.c || echo
'./'`a_md5encrypt.c
In file included from a_md5encrypt.c:23:
../include/ntp_stdlib.h:139: error: array type has incomplete element
type
make[3]: *** [a_md5encrypt.o] Error 1
make[3]: Leaving directory
`/mnt/film2/ARM/buildroot/build_arm/ntp-4.1.1/libntp'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/mnt/film2/ARM/buildroot/build_arm/ntp-4.1.1'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/mnt/film2/ARM/buildroot/build_arm/ntp-4.1.1'
make: *** [/mnt/film2/ARM/buildroot/build_arm/ntp-4.1.1/ntpdate/ntpdate]
Error 2
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 09-07-05 17:27  
---------------------------------------------------------------------- 
ntp-4.2.0 is in svn now 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-17-05 11:07  marvin         New Issue                                    
06-20-05 09:28  marvin         Issue Monitored: marvin                      
09-07-05 17:27  vapier         Note Added: 0000501                          
09-07-05 17:27  vapier         Status                   assigned => closed  
09-07-05 17:27  vapier         Resolution               open => unable to
reproduce
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
