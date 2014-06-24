From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:35 -0300
Subject: [Buildroot] [PATCH 29/54] python-id3: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-29-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-id3/python-id3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-id3/python-id3.mk b/package/python-id3/python-id3.mk
index 5957f64..157576e 100644
--- a/package/python-id3/python-id3.mk
+++ b/package/python-id3/python-id3.mk
@@ -8,5 +8,7 @@ PYTHON_ID3_VERSION = 1.2
 PYTHON_ID3_SOURCE = id3-py_$(PYTHON_ID3_VERSION).tar.gz
 PYTHON_ID3_SITE = http://downloads.sourceforge.net/project/id3-py/id3-py/$(PYTHON_ID3_VERSION)
 PYTHON_ID3_SETUP_TYPE = distutils
+PYTHON_ID3_LICENSE = GPLv2+
+PYTHON_ID3_LICENSE_FILES = COPYING
 
 $(eval $(python-package))
-- 
1.8.5.5
