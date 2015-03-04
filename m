From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed,  4 Mar 2015 17:00:09 +0100
Subject: [Buildroot] [PATCH v3 2/4] python-markdown: add host-package support
In-Reply-To: <1425484811-26238-1-git-send-email-gwenj@trabucayre.com>
References: <1425484811-26238-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <1425484811-26238-2-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Host-cheetah needs host-markdown.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/python-markdown/python-markdown.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index 864825e..3b2217e 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -12,3 +12,4 @@ PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = distutils
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.0.5
