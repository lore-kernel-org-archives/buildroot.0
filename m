From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2014 21:56:46 +0100
Subject: [Buildroot] [git commit] manual: clarify handling of deprecated
	features
Message-ID: <20140121205928.0E1309C545@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa1845e813e764729eed2a4b562a0ec5b91888ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/appendix.txt |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index 74ee8fd..a83ecea 100644
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
