From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Apr 2015 06:48:22 -0300
Subject: [Buildroot] [PATCH v3 07/11] librsvg: add hash file
In-Reply-To: <1429436906-15222-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429436906-15222-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1429436906-15222-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/librsvg/librsvg.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/librsvg/librsvg.hash

diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
new file mode 100644
index 0000000..7572d6c
--- /dev/null
+++ b/package/librsvg/librsvg.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/gnome/sources/librsvg/2.26/librsvg-2.26.3.sha256sum
+sha256	3761e3d446a9c2f4ebe52431289e15976f1d447f64ed33bb7f35cb1c430eac49	librsvg-2.26.3.tar.gz
-- 
2.0.5
