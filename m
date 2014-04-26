From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Apr 2014 20:51:33 +0200
Subject: [Buildroot] [git commit] czmq: fix license after version bump
Message-ID: <20140426185205.8BD559CA0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f64cd187c1b23e7201a91850cbfd3e8c37ba8a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

czmq is now under the MPLv2.0 license. For more details, see
https://github.com/zeromq/czmq/commit/eabe063c2588cde0af90e

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/czmq/czmq.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index 4703041..2f6866b 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -11,8 +11,8 @@ CZMQ_SITE = git://github.com/zeromq/czmq.git
 CZMQ_AUTORECONF = YES
 CZMQ_INSTALL_STAGING = YES
 CZMQ_DEPENDENCIES = zeromq
-CZMQ_LICENSE = LGPLv3+ with exceptions
-CZMQ_LICENSE_FILES = COPYING COPYING.LESSER
+CZMQ_LICENSE = MPLv2.0
+CZMQ_LICENSE_FILES = LICENSE
 
 # asciidoc is a python script that imports unicodedata, which is not in
 # host-python, so disable asciidoc entirely.
