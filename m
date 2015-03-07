From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Mar 2015 14:39:57 +0100
Subject: [Buildroot] [PATCH 0/3] uClibc-ng related fixes
Message-ID: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch series is a proposal to solve the same problem as
http://patchwork.ozlabs.org/patch/446288/ but in an hopefully nicer
way (first patch).

The other two patches are related improvements/fixes.

Thanks,

Thomas

Thomas Petazzoni (3):
  uclibc: adapt thread implementation selection to uClibc-ng
  uclibc: remove bogus comment about thread implementation selection
  uclibc: add patch fixing non-threaded build on Xtensa for uClibc-ng
    1.0.0

 .../0002-fix-non-thread-compile-for-xtensa.patch   | 49 ++++++++++++++++++++++
 package/uclibc/Config.in                           | 48 ++++++++++++++-------
 2 files changed, 83 insertions(+), 14 deletions(-)
 create mode 100644 package/uclibc/1.0.0/0002-fix-non-thread-compile-for-xtensa.patch

-- 
2.1.0
