From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 27 Apr 2015 01:40:21 +0200
Subject: [Buildroot] [PATCH 4/4] manual: don't use a comment at the end of
	the version variable assignment
In-Reply-To: <1430091621-4698-1-git-send-email-fabio.porcedda@gmail.com>
References: <1430091621-4698-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1430091621-4698-5-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The comment at the end of the version string assigment could lead to a download
failure so don't use it as a example.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-tips.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 6f5e785..6699951 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -42,7 +42,8 @@ on GitHub. As GitHub is known to have changed download mechanisms in the
 past, the 'github' helper function should be used as shown below.
 
 ------------------------
-FOO_VERSION = v1.0 # tag or full commit ID
+# Use a tag or a full commit ID
+FOO_VERSION = v1.0
 FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
 ------------------------
 
-- 
2.3.5
