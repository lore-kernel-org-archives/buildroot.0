From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Aug 2010 10:51:26 +0200
Subject: [Buildroot] [pull request] Pull request for branch for-2010.08-2
Message-ID: <cover.1283158281.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit e8fdc08dc39ea28e5e098f696477e4a13f4ebd94:
  Stanislav Bogatyrev (1):
        uClibc: fix ppc e500 handling

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2010.08-2

Thomas Petazzoni (2):
      Add the patch fixing gcc 4.2.4 to gcc 4.2.2
      kismet: fix build when none of client, server or drone are selected

 package/kismet/kismet.mk                           |    7 ++-
 .../1001-gcc-4.2.x-inhibit-libc.patch              |   49 ++++++++++++++++++++
 2 files changed, 53 insertions(+), 3 deletions(-)
 create mode 100644 toolchain/gcc/4.2.2-avr32-2.1.5/1001-gcc-4.2.x-inhibit-libc.patch

Thanks,
-- 
Thomas Petazzoni
