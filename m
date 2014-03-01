From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  2 Mar 2014 00:39:47 +0100
Subject: [Buildroot] [PATCH 0/6] Lttng packages bump
Message-ID: <1393717193-19774-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a short series bumping LTTng related packages to their latest
version.

Yours,
Samuel

Samuel Martin (6):
  liburcu: bump version to 0.8.3
  lttng-libust: bump version to 2.4.0
  lttng-modules: bump version to 2.4.0
  lttng-tools: bump version to 2.4.0
  lttng-babeltrace: bump version to 1.2.0
  liburcu: disable build with gcc-4.8.x on ARM

 package/liburcu/Config.in                    | 11 +++++++++++
 package/liburcu/liburcu.mk                   |  6 +++---
 package/lttng-babeltrace/lttng-babeltrace.mk |  6 +++---
 package/lttng-libust/Config.in               |  6 ++++++
 package/lttng-libust/lttng-libust.mk         |  4 ++--
 package/lttng-modules/lttng-modules.mk       |  2 +-
 package/lttng-tools/Config.in                |  6 ++++++
 package/lttng-tools/lttng-tools.mk           |  7 +++----
 8 files changed, 35 insertions(+), 13 deletions(-)

--
1.9.0
