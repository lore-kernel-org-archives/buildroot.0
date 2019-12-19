From: Jan Kiszka <jan.kiszka@siemens.com>
Date: Thu, 19 Dec 2019 09:24:30 +0100
Subject: [Buildroot] [PATCH v2 0/4] package/xenomai: Fixes, updates,
 enhancements
Message-ID: <cover.1576743874.git.jan.kiszka@siemens.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes in v2:
 - add option to choose git, rather then overloading BR2_PACKAGE_XENOMAI_VERSION
 - use XENOMAI_AUTORECONF for git
 - de-capitalize patch subjects

Jan

Jan Kiszka (4):
  package/xenomai: smokey's not a skin
  package/xenomai: bump version to 3.0.10
  package/xenomai: allow to pull git revisions
  package/xenomai: clean up wrappers cleanup

 package/xenomai/Config.in    | 28 ++++++++++++++++++++++------
 package/xenomai/xenomai.hash |  2 +-
 package/xenomai/xenomai.mk   | 41 +++++++++++++++++++++++------------------
 3 files changed, 46 insertions(+), 25 deletions(-)

-- 
2.16.4
