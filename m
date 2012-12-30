From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 30 Dec 2012 23:17:43 +0100
Subject: [Buildroot] [pull request] Pull request for branch for-master/lttng
Message-ID: <cover.1356905589.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is version bump for Lttng and related packages.

The following changes since commit f1d44593a04ff3be981c8a3b01a502f0b18193ee:

  docs/manual: small fixes and enhancements to adding generic packages (2012-12-30 22:39:13 +0100)

are available in the git repository at:

  git at github.com:tSed/buildroot.git for-master/lttng

for you to fetch changes up to 192d7031d43a55c00114dbb0bc54b697e4baf02e:

  lttng-babeltrace: bump to 1.0.0 (2012-12-30 23:04:51 +0100)

----------------------------------------------------------------
Samuel Martin (4):
      lttng-libust: bump to 2.1.0
      lttng-modules: bump to 2.1.0
      lttng-tools: bump to 2.1.0
      lttng-babeltrace: bump to 1.0.0

 package/lttng-babeltrace/lttng-babeltrace.mk       |  2 +-
 ...t-dont-build-cxx-tests-when-not-available.patch | 13 ++--
 .../lttng-libust-uclibc-sched_getcpu.patch         | 32 ---------
 package/lttng-libust/lttng-libust.mk               |  2 +-
 package/lttng-modules/lttng-modules.mk             |  2 +-
 ...ng-tools-Support-new-lttng-ust-error-code.patch | 82 ++++++++++++++++++++++
 .../lttng-tools-no-sync-file-range-in-uclibc.patch | 51 +++++++-------
 package/lttng-tools/lttng-tools.mk                 |  5 +-
 8 files changed, 122 insertions(+), 67 deletions(-)
 delete mode 100644 package/lttng-libust/lttng-libust-uclibc-sched_getcpu.patch
 create mode 100644 package/lttng-tools/lttng-tools-Support-new-lttng-ust-error-code.patch

Yours,

--

Samuel
