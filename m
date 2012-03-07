From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Mar 2012 20:27:56 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.05/php-bump
Message-ID: <cover.1331148472.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit b50f7a832de2801aeee33146ff5a81945f4078c2:

  barebox: fix 2012.03 typo (2012-03-07 16:26:50 +0100)

are available in the git repository at:
  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.05/php-bump

Thomas Petazzoni (1):
      php: bump to 5.4.0

 ...hen-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch |   30 --------------------
 package/php/php.mk                                 |    2 +-
 2 files changed, 1 insertions(+), 31 deletions(-)
 delete mode 100644 package/php/php-5.2.16-fix-build-when-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch

Thanks,
-- 
Thomas Petazzoni
