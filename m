From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:04:57 +0100
Subject: [Buildroot] [git commit] swig: comma separate licenses
Message-ID: <20151215210845.3654780409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e0627c88fcb11939c5661c406ff3fd7862709dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
