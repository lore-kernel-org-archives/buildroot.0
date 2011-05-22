From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2011 16:32:48 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.05/kbd-libintl-fixes
Message-ID: <cover.1306074766.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit a02cfbf1f4a82ee6582e2bf7622b2bf105359ea9:

  bind: give path to OpenSSL when OpenSSL is enabled (2011-05-19 20:03:35 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.05/kbd-libintl-fixes

Thomas Petazzoni (2):
      kbd: make sure to link against libintl when needed
      kbd: rename the makefile so that it's named the same as the package

 package/kbd/Config.in                      |    2 +
 package/kbd/kbd-link-against-libintl.patch |   34 ++++++++++++++++++++++++++++
 package/kbd/{kdb.mk => kbd.mk}             |    2 +
 3 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 package/kbd/kbd-link-against-libintl.patch
 rename package/kbd/{kdb.mk => kbd.mk} (67%)

Thanks,
-- 
Thomas Petazzoni
