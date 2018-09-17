From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 17 Sep 2018 23:12:17 +0200
Subject: [Buildroot] [PATCH 0/2] at: bump version
Message-ID: <20180917211219.17868-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested at https://elinux.org/Buildroot#Todo_list:
"Update the at package to use the upstream.
http://anonscm.debian.org/gitweb/?p=collab-maint/at.git;a=summary"
In the meanwhile that site became unreachable and the at upstream now is:
https://salsa.debian.org/debian/at

These are the basic tasks done:
- change upstream site, bump version
- add sha256 for legal-info files

Giulio Benetti (2):
  at: change upstream site, bump version
  at: add sha256 for legal-info files

 ...-Makefile-fix-parallel-build-failure.patch | 33 +++++++++++++++++++
 package/at/at.hash                            |  7 ++--
 package/at/at.mk                              |  9 ++---
 3 files changed, 43 insertions(+), 6 deletions(-)
 create mode 100644 package/at/0007-Makefile-fix-parallel-build-failure.patch

-- 
2.17.1
