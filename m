From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 12:05:10 +0100
Subject: [Buildroot] [PATCH 0/3] oprofile: small set of fixes
Message-ID: <1419851113-11865-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a small set of fixes/improvements to the oprofile package: fix
autobuilder issue appearing since the 1.0.0 bump, remove no longer
needed autoreconf, and a minor cleanup.

Thomas

Thomas Petazzoni (3):
  oprofile: fix nanosleep() issue on non-threaded toolchains
  oprofile: autoreconf is no longer needed
  oprofile: cleanup the style of the OPROFILE_BINARIES definition

 .../0001-Include-time.h-for-nanosleep.patch        | 44 ++++++++++++++++++++++
 package/oprofile/oprofile.mk                       | 17 +++------
 2 files changed, 50 insertions(+), 11 deletions(-)
 create mode 100644 package/oprofile/0001-Include-time.h-for-nanosleep.patch

-- 
2.1.0
