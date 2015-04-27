From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Apr 2015 10:03:07 -0300
Subject: [Buildroot] [PATCH 16/16] texinfo: add hash file
In-Reply-To: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1430139787-19304-16-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/texinfo/texinfo.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/texinfo/texinfo.hash

diff --git a/package/texinfo/texinfo.hash b/package/texinfo/texinfo.hash
new file mode 100644
index 0000000..656c390
--- /dev/null
+++ b/package/texinfo/texinfo.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	1303e91a1c752b69a32666a407e9fbdd6e936def4b09bc7de30f416301530d68	texinfo-4.13a.tar.gz
-- 
2.0.5
