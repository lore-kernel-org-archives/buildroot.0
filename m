From: Thomas Lundquist <lists@zelow.no>
Date: Thu, 19 Oct 2006 10:08:04 +0200
Subject: [Buildroot] ltrace
Message-ID: <20061019080804.GB29730@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello folks.

have anyone gotten ltrace to work? I've tried for arm and i386 but get
the same error:

checking for gelf.h... no
configure: error: gelf.h not found
make: ***
[/local/export/home/thomasez/buildroot.lzma2/build_i686/ltrace-0.3.36/.configured]
Error 1

I've tried to add -I (to TARGET/usr/incluve, where it is) but  to no
avail. I've installed the libelf-dev package on my host and I've tried
ltrace 4.0.


any ideas?
Thomas.
