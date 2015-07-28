From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:48 -0300
Subject: [Buildroot] [PATCH 107/113] b43-fwcutter: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-107-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/b43-fwcutter/b43-fwcutter.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/b43-fwcutter/b43-fwcutter.hash

diff --git a/package/b43-fwcutter/b43-fwcutter.hash b/package/b43-fwcutter/b43-fwcutter.hash
new file mode 100644
index 0000000..3181c76
--- /dev/null
+++ b/package/b43-fwcutter/b43-fwcutter.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	4c6a53d1f5d76b8aa224d294bee47726b1477f35327f4e23e8cb799865e0f6eb	b43-fwcutter-015.tar.bz2
-- 
2.3.6
