From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 22 Apr 2008 03:49:58 -0700
Subject: [Buildroot] [buildroot 0003044]: problem:asterisk port to openwrt
Message-ID: <e88e20e432edf3551013a49576867f7f@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3044 
====================================================================== 
Reported By:                gebecom
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3044
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-22-2008 03:49 PDT
Last Modified:              04-22-2008 03:49 PDT
====================================================================== 
Summary:                    problem:asterisk port to openwrt
Description: 
i use asterisk 1.4.19 . i have cross compiled with buildroot  
CXX=/build-tools/buildroot/build_mipsel/staging_dir/bin/mipsel-linux-g++ 
CC=/build-tools/buildroot/build_mipsel/staging_dir/bin/mipsel-linux-gcc
AS=/build-tools/buildroot/build_mipsel/staging_dir/bin/mipsel-linux-as
AR=/build-tools/buildroot/build_mipsel/staging_dir/bin/mipsel-linux-ar 
RANLIB=/build-tools/buildroot/build_mipsel/staging_dir/bin/mipsel-linux-ranlib
STRIP=/build-tools/buildroot/build_mipsel/staging_dir/bin/mipsel-linux-strip
LD=/build-tools/buildroot/build_mipsel/staging_dir/bin/mipsel-linux-ld
NM=/build-tools/buildroot/build_mipsel/staging_dir/bin/mipsel-linux-nm 
./configure  --build=mipsel-linux --host=x86_64-linux
-prefix=/build-toos/buildroot/toolchain_build_mipsel/ --enable-static  
--target=mipsel-linux     --enable-little-endian
--with-extraincdir=/build-tools/buildroot/build_mipsel/staging_dir/include
--with-extralibdir=/build-tools/buildroot/build_mipsel/staging_dir/lib
--with-termcap=/build-tools/buildroot/package/termcap-1.3.1/
--without-pwlib --with-zlib=/build-tools/buildroot/package/zlib/
--with-curl=/build-tools/buildroot/package/curl/ --without-popt
--without-ogg --without-tds
--with-squlite=/build-tools/buildroot/package/sqlite/ --without-postgres
--localstatedir=/opt/var --sysconfdir=/opt/etc

after that what do i do ? can anyone tell me?
only excute make , or anything else?(Makefile change?how?)
i dont know.
thanks im advance!

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-22-08 03:49  gebecom        New Issue                                    
04-22-08 03:49  gebecom        Status                   new => assigned     
04-22-08 03:49  gebecom        Assigned To               => buildroot       
======================================================================
