From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 22:09:00 +0100
Subject: [Buildroot] [PATCH v2 2/6] docs/manual: indicate how to handle
	BR2_TOOLCHAIN_HAS_THREADS_NPTL
In-Reply-To: <1392757744-29984-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392757744-29984-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392757744-29984-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 40af809..3dc5395 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -235,7 +235,12 @@ use in the comment.
 
 * thread support
 ** Dependency symbol: +BR2_TOOLCHAIN_HAS_THREADS+
-** Comment string: +threads+
+** Comment string: +threads+ (unless +BR2_TOOLCHAIN_HAS_THREADS_NPTL+
+   is also needed, in which case, specifying only +NPTL+ is sufficient)
+
+* NPTL thread support
+** Dependency symbol: +BR2_TOOLCHAIN_HAS_THREADS_NPTL+
+** Comment string: +NPTL+
 
 * RPC support
 ** Dependency symbol: +BR2_TOOLCHAIN_HAS_NATIVE_RPC+
-- 
1.8.3.2
