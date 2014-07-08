From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jul 2014 23:42:44 +0200
Subject: [Buildroot] [git commit] torsmo: add license information
Message-ID: <20140708222427.D9CF89D1CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfa1adc4b8fb4621128c2a0b687b15b9d6ede527
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/torsmo/torsmo.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
index ad846ca..ebe68a0 100644
--- a/package/torsmo/torsmo.mk
+++ b/package/torsmo/torsmo.mk
@@ -6,6 +6,8 @@
 
 TORSMO_VERSION = 0.18
 TORSMO_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/Torsmo
+TORSMO_LICENSE = BSD-3c
+TORSMO_LICENSE_FILES = COPYING
 
 # help2man doesn't work when cross compiling
 TORSMO_CONF_ENV = ac_cv_path_HELP2MAN=''
