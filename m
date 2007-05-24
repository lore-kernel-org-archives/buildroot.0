From: Petur Thors <peturth@hi.is>
Date: Thu, 24 May 2007 19:28:44 +0000
Subject: [Buildroot] Typo:  /toolchain/gcc/gcc-uclibc-3.x.mk
Message-ID: <4655E76C.2040405@hi.is>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
Just bumped into a typo in buildroot/toolchain/gcc/gcc-uclibc-3.x.mk 
which (obviously) breaks the build :
libstc++.so* instead of libstdc++.so*  :)

introduced in svn commit  here : 
http://busybox.net/lists/buildroot/2007-May/002674.html

Thanks and best regards
Petur Thors
