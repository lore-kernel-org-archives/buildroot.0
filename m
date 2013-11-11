From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 15:06:34 +0100
Subject: [Buildroot] [git commit] docs/manual: Add version number to perl in
	prerequisites
Message-ID: <20131111140726.F0D6C9BBCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3766198db3a0f52db8e8ea53edb9321a33efe34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building host-bison needs perl 5.8.7+, as it uses the "-f" option
for site customization scripts. This feature was added in 5.8.7.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/prerequisite.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 729d64c..adc23ee 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -33,7 +33,7 @@ Mandatory packages
 ** +patch+
 ** +gzip+
 ** +bzip2+
-** +perl+
+** +perl+ (version 5.8.7 or any later)
 ** +tar+
 ** +cpio+
 ** +python+ (version 2.6 or 2.7)
