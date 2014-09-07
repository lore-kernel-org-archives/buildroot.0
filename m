From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Sep 2014 21:56:47 +0200
Subject: [Buildroot] [git commit] efl: bump to version 1.7.10
Message-ID: <20140907195715.8B4ED9D5B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f119452e260ab4dbc33cce73c17a24ed9ac98e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/efl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 1de68cf..aa6630c 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -1,3 +1,3 @@
-EFL_VERSION = 1.7.7
+EFL_VERSION = 1.7.10
 
 include $(sort $(wildcard package/efl/*/*.mk))
