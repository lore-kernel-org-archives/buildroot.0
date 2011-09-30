From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Sep 2011 20:45:55 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.11/pkg-infra-urgent
Message-ID: <cover.1317408294.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is an urgent fix that follows the changes in the package
infrastructure. Unfortunately, those changes break the build of
bootloaders (they are ignored by the build process).

Thomas

The following changes since commit 8511728696a298ccdb8b902b60ab398d8f67e745:

  gnutls: bump to version 2.10.5 (2011-09-30 08:26:08 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.11/pkg-infra-urgent

Thomas Petazzoni (1):
      package: fix bootloader building

 package/Makefile.package.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

Thanks,
-- 
Thomas Petazzoni
