From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2011 09:55:53 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.11/build-fixes
Message-ID: <cover.1321174528.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are three fixes for build failures detected when doing
randpackageconfig builds.

Thomas

The following changes since commit 296eb11299d1240b3570aba5abb8374a0911bf44:

  pulseaudio: needs host-intltool (2011-10-29 16:35:47 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.11/build-fixes

Thomas Petazzoni (3):
      gdb: do not allow native gdb on SuperH architecture
      crosstool-ng: add patch to use wget instead of curl
      target gdb: depend on thread support

 .../crosstool-ng-001-wget-instead-of-curl.patch    |   52 ++++++++++++++++++++
 toolchain/gdb/Config.in                            |    2 +
 2 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 package/crosstool-ng/crosstool-ng-001-wget-instead-of-curl.patch

Thanks,
-- 
Thomas Petazzoni
