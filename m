From: olyvine.chen at logiways.com.cn <olyvine.chen@logiways.com.cn>
Date: Fri, 08 Oct 2010 12:23:47 +0800
Subject: [Buildroot] buildroot not support c++ compliing
Message-ID: <1286511827.3703.11.camel@olyvine-desktop.logiways-sz.cn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,
        
  I now try to add package libmusicbrainz to buildroot, but many errors
happen, such as the following:

*************************************************************************

buildroot/output/build/libmusicbrainz-3.0.2/src/artist.cpp:23:18: error:
string: No such file or directory

*************************************************************************
  it seems indicate that no c++ library available, then how to enable c
++ compiling for buildroot? 
        
  I enabled glibc via:
  Toolchain => Toolchain type (External toolchain) => External toolchain
C library (glibc)
        
Kindest regards!
Olyvine
