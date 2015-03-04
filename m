From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 22:46:44 +0100
Subject: [Buildroot] [git commit] python-markdown: add host-package support
Message-ID: <20150304214718.C78BA807B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5747cc4eb6abb66336e01a2e5f6aeb283b0890c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Host-cheetah needs host-markdown.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-markdown/python-markdown.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index 864825e..3b2217e 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -12,3 +12,4 @@ PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = distutils
 
 $(eval $(python-package))
+$(eval $(host-python-package))
