From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Oct 2013 21:56:50 +0100
Subject: [Buildroot] [PATCH] docs: document dhcpcd build problem on Blackfin
Message-ID: <1383080210-6155-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/known-issues.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
index 22710fb..d390b93 100644
--- a/docs/manual/known-issues.txt
+++ b/docs/manual/known-issues.txt
@@ -30,3 +30,6 @@ Known issues
 * The +prboom+ package triggers a compiler failure with the SuperH 4
   compiler from Sourcery CodeBench, version 2012.09.
 
+* The +dhcpcd+ package doesn't build with the Blackfin toolchains
+  provided by Analog Devices, because they lack the
+  +UCLIBC_SUPPORT_AI_ADDRCONFIG+ option.
-- 
1.8.1.2
