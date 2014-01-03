From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 03 Jan 2014 17:02:51 +0100
Subject: [Buildroot] [PATCH 2 of 5 v3] manual: clarify handling of
	deprecated features
In-Reply-To: <patchbomb.1388764969@argentina>
References: <patchbomb.1388764969@argentina>
Message-ID: <a0369d66d776e95bf71a.1388764971@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/appendix.txt |  8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -29,6 +29,12 @@ Deprecated features
 -------------------
 
 The following features are marked as _deprecated_ in Buildroot due to
-their status either too old or unmaintained.
+them being either too old or unmaintained. They will be removed at
+some point, so stop using them.
+Each deprecated symbol in kconfig depends on a symbol
++BR2_DEPRECATED_SINCE_xxxx_xx+, which provides an indication of when
+the feature can be removed: features will not be removed within the
+year following deprecation. For example, a symbol depending on
++BR2_DEPRECATED_SINCE_2013_05+ can be removed from 2014.05 onwards.
 
 include::deprecated-list.txt[]
