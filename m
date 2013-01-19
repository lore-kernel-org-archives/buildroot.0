From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 19 Jan 2013 12:03:44 +0100
Subject: [Buildroot] [pull request] Pull request for branch for-master/lttng
Message-ID: <cover.1358593210.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is version bump for LTTng and related packages.

The following changes since commit e81e2770aff61d07306d0448bd434d613ed9afef:

  gd: explictly disable freetype support when not available (2013-01-18 23:22:32 +0100)

are available in the git repository at:

  git at github.com:tSed/buildroot.git for-master/lttng

for you to fetch changes up to 0660c79ae34b8e93da0f9835fd0b4d575e285701:

  lttng-babeltrace: bump to version 1.0.2 (2013-01-19 11:57:15 +0100)

----------------------------------------------------------------
Samuel Martin (4):
      liburcu: bump to version 0.7.6
      lttng-tools: bump to version 2.1.1
      lttng-libust: bump to version 2.1.1
      lttng-babeltrace: bump to version 1.0.2

 package/liburcu/liburcu.mk                         |  2 +-
 package/lttng-babeltrace/lttng-babeltrace.mk       |  2 +-
 package/lttng-libust/lttng-libust.mk               |  2 +-
 ...ng-tools-Support-new-lttng-ust-error-code.patch | 82 ----------------------
 .../lttng-tools-no-sync-file-range-in-uclibc.patch | 51 --------------
 package/lttng-tools/lttng-tools.mk                 |  2 +-
 6 files changed, 4 insertions(+), 137 deletions(-)
 delete mode 100644 package/lttng-tools/lttng-tools-Support-new-lttng-ust-error-code.patch
 delete mode 100644 package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch

Yours,

--

Samuel
