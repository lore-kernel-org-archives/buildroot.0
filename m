From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue,  3 Apr 2012 10:55:28 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.05/packages
Message-ID: <cover.1333443312.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit e1443db85bc7dc2a863c4bbfdf6fe777f390ad70:

  kernel-headers: bump 3.{0,2,3}.x stable versions (2012-04-02 23:46:55 +0200)

are available in the git repository at:
  git://git.free-electrons.com/users/maxime-ripard/buildroot.git for-2012.05/packages

Maxime Ripard (4):
      Convert tinyhttpd to gentargets
      Bump version of ltrace
      Fix libpng url
      Fix installation of socketcand

 package/libpng/libpng.mk                           |    2 +-
 package/ltrace/ltrace-0.5.3-configure-fixes.patch  |  128 --------------------
 package/ltrace/ltrace-0.5.3-susv3-legacy.patch     |   20 ---
 ...nning-in-ARM-arch_-dis-en-able_breakpoint.patch |   67 ++++++++++
 package/ltrace/ltrace.mk                           |   40 +------
 .../socketcand-replace-cp-by-install.patch         |   25 ++++
 package/tinyhttpd/tinyhttpd.mk                     |   58 ++-------
 7 files changed, 111 insertions(+), 229 deletions(-)
 delete mode 100644 package/ltrace/ltrace-0.5.3-configure-fixes.patch
 delete mode 100644 package/ltrace/ltrace-0.5.3-susv3-legacy.patch
 create mode 100644 package/ltrace/ltrace-0.6.0-fix-type-punning-in-ARM-arch_-dis-en-able_breakpoint.patch
 create mode 100644 package/socketcand/socketcand-replace-cp-by-install.patch

Thanks,
-- 
Maxime Ripard
