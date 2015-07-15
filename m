From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:19 -0300
Subject: [Buildroot] [PATCH 28/40] libdvdread: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-28-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libdvdread/libdvdread.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libdvdread/libdvdread.hash

diff --git a/package/libdvdread/libdvdread.hash b/package/libdvdread/libdvdread.hash
new file mode 100644
index 0000000..11cc1ce
--- /dev/null
+++ b/package/libdvdread/libdvdread.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	af9b98f049580a6521d56c978b736d3d609562dd12955e11d50e26d97542dcd4	libdvdread-4.2.1.tar.xz
-- 
2.3.6
