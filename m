From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:36:50 +0100
Subject: [Buildroot] [PATCH 15/31] package/libffi: add license hash
In-Reply-To: <20171103103706.25574-1-s.martin49@gmail.com>
References: <20171103103706.25574-1-s.martin49@gmail.com>
Message-ID: <20171103103706.25574-16-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libffi/libffi.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index 63a9203f9b..ceebdad24d 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,2 +1,4 @@
 # From ftp://sourceware.org/pub/libffi/sha512.sum
 sha512	980ca30a8d76f963fca722432b1fe5af77d7a4e4d2eac5144fbc5374d4c596609a293440573f4294207e1bdd9fda80ad1e1cafb2ffb543df5a275bc3bd546483  libffi-3.2.1.tar.gz
+# Locally computed
+sha256	0f4d7a0bfb83c37465d42dc305f124189196cc0cc2cc8d6f8461103682aebbc5  LICENSE
-- 
2.15.0
