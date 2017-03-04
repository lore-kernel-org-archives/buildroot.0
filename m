From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Mar 2017 15:35:01 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: remove cosmo package
Message-ID: <20170304143539.3C8A581E81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1558a93484b8f95153d64f90a688707f5aeb747f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cosmo package has been removed in commit
2c8438866394f2146ab60c483a820e3ca78ce560, but the entry in the
DEVELOPERS file was forgotten.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 361f902..356ff46 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -516,7 +516,6 @@ F:	board/olimex/a20_olinuxino
 F:	configs/olimex_a20_olinuxino_*
 F:	package/4th/
 F:	package/botan/
-F:	package/cosmo/
 F:	package/dado/
 F:	package/ficl/
 F:	package/gdbm/
