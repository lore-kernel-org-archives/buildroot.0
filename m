From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Nov 2012 23:36:01 +0100
Subject: [Buildroot] Deprecate the support for toolchain on the target
Message-ID: <cover.1352586949.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 234fe4433489bca81b79311239569525cc008d9d:

  perl: build with perlcross instead of qemu (2012-11-09 10:04:31 +0100)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git no-target-toolchain

for you to fetch changes up to c42b5a3ae08ae07779a6ee389a8367318efe96bf:

  Mark a number of development related packages as deprecated (2012-11-10 23:34:39 +0100)

----------------------------------------------------------------
Thomas Petazzoni (2):
      Deprecate the support for the toolchain on target
      Mark a number of development related packages as deprecated

 Config.in                  |    4 ++++
 package/autoconf/Config.in |    3 +++
 package/automake/Config.in |    3 +++
 package/libtool/Config.in  |    2 ++
 package/make/Config.in     |    2 ++
 toolchain/gcc/Config.in.2  |    5 ++---
 6 files changed, 16 insertions(+), 3 deletions(-)

Thanks,
-- 
Thomas Petazzoni
