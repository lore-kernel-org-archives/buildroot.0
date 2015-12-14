From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:11:19 -0300
Subject: [Buildroot] [PATCH 40/45] swig: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-41-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/swig/swig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index cd816b4..e4bd64c 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -12,7 +12,7 @@ HOST_SWIG_CONF_OPTS = \
 	--without-pcre \
 	--disable-ccache \
 	--without-octave
-SWIG_LICENSE = GPLv3+ BSD-2c BSD-3c
+SWIG_LICENSE = GPLv3+, BSD-2c, BSD-3c
 SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 
 # CMake looks first at swig3.0, then swig2.0 and then swig. However,
-- 
2.4.10
