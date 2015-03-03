From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  3 Mar 2015 09:41:13 +0100
Subject: [Buildroot] [PATCH 3/5] libass: add hash file
In-Reply-To: <1425372075-22985-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1425372075-22985-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1425372075-22985-3-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/libass/libass.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libass/libass.hash

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
new file mode 100644
index 0000000..b7510de
--- /dev/null
+++ b/package/libass/libass.hash
@@ -0,0 +1,2 @@
+# From https://code.google.com/p/libass/downloads/detail?name=libass-0.10.2.tar.xz&can=2&q=
+sha1 72a153364e838d3b561bae3653f1515169d479c4 libass-0.10.2.tar.xz
-- 
1.9.1
