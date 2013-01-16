From: Matt Weber <rc.lsw.collaborate@gmail.com>
Date: Wed, 16 Jan 2013 06:12:53 -0600
Subject: [Buildroot] [PATCH 2/2] new package: python-posix_ipc
In-Reply-To: <1358338373-8288-1-git-send-email-rc.lsw.collaborate@gmail.com>
References: <1358338373-8288-1-git-send-email-rc.lsw.collaborate@gmail.com>
Message-ID: <1358338373-8288-2-git-send-email-rc.lsw.collaborate@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Matt Weber <rc.lsw.collaborate@gmail.com>
---
 package/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/Config.in b/package/Config.in
index c59f342..425da34 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -322,6 +322,7 @@ source "package/python-mad/Config.in"
 source "package/python-meld3/Config.in"
 source "package/python-netifaces/Config.in"
 source "package/python-nfc/Config.in"
+source "package/python-posix_ipc/Config.in"
 source "package/python-protobuf/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
-- 
1.7.9.5
