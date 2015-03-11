From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Mar 2015 16:26:29 -0300
Subject: [Buildroot] [PATCH] avahi: add hash file
Message-ID: <1426101989-20525-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Help counteract upstream website issues, fixes:
http://autobuild.buildroot.net/results/103/103e5a62d16ed22414cc407eff8a78d5e8d7503c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/avahi/avahi.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/avahi/avahi.hash

diff --git a/package/avahi/avahi.hash b/package/avahi/avahi.hash
new file mode 100644
index 0000000..99bbd51
--- /dev/null
+++ b/package/avahi/avahi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	8372719b24e2dd75de6f59bb1315e600db4fd092805bd1201ed0cb651a2dab48	avahi-0.6.31.tar.gz
-- 
2.0.5
