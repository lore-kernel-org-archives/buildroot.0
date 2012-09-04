From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Sep 2012 15:49:42 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	uclibc-arch-type-cleanup
Message-ID: <cover.1346766545.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a simple patch set that moves BR2_ARM_TYPE and BR2_SPARC_TYPE
to a uClibc-specific place, since those are uClibc specific.

Thomas

The following changes since commit 27045cde7d18f6132ab804ed30673e3fb3961879:

  gcc: default to 4.6.x (2012-09-04 13:28:03 +0200)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git uclibc-arch-type-cleanup

for you to fetch changes up to 10451abfa0e2d9ad6d322ec73a726bf520c4c46e:

  Move BR2_SPARC_TYPE to an uClibc specific place (2012-09-04 15:48:24 +0200)

----------------------------------------------------------------
Thomas Petazzoni (2):
      Move BR2_ARM_TYPE to an uClibc specific place
      Move BR2_SPARC_TYPE to an uClibc specific place

 target/Config.in.arch      |   26 --------------------------
 toolchain/uClibc/Config.in |   30 ++++++++++++++++++++++++++++++
 toolchain/uClibc/uclibc.mk |    4 ++--
 3 files changed, 32 insertions(+), 28 deletions(-)

Thanks,
-- 
Thomas Petazzoni
