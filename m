From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jul 2013 21:57:06 +0200
Subject: [Buildroot] [git commit] python3: remove smtpd.py.3 sample
Message-ID: <20130710202004.A4B779A196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c492a9a24af66e641d8e718620b00318fac89590
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python3/python3.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index ed79f8e..036d1ac 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -141,6 +141,7 @@ define PYTHON3_REMOVE_USELESS_FILES
 	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)-config
 	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)m-config
 	rm -f $(TARGET_DIR)/usr/bin/python3-config
+	rm -f $(TARGET_DIR)/usr/bin/smtpd.py.3
 	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-3.3m/ \
 		-type f -not -name pyconfig.h -a -not -name Makefile` ; do \
 		rm -f $$i ; \
