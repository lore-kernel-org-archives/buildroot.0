From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Jul 2014 09:40:01 -0300
Subject: [Buildroot] [PATCH 03/13] torsmo: add license information
In-Reply-To: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1404304811-27480-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/torsmo/torsmo.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.8.5.5
