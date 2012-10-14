From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 11:35:37 +0200
Subject: [Buildroot] [PATCH 0 of 1] Minor fix to CMakeLists.txt to disable
 C++ compiler check
Message-ID: <patchbomb.1350207337@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Radek,

You'll find in the following e-mail a patch that disables the unneeded
(and sometimes problematic) C++ compiler check from CMakeLists.txt. It
has been found while using unionfs-fuse in the context of the
Buildroot embedded Linux build system (http://www.buildroot.org), for
which we sometimes use toolchains that don't have C++ support.

Thanks,

Thomas
-- 
Thomas Petazzoni
http://www.free-electrons.com
