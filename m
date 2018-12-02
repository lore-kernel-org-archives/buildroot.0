From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 02 Dec 2018 07:19:28 -0000
Subject: [Buildroot] [git commit] package/proftpd: add sendfile
Message-ID: <20181202071555.670988A3F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff59a29732a6671c858dfe4cef851dff76f7f995
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enables sendfile to ProFTPD for zero-copy transfers.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/proftpd/proftpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 324a602761..a228d58e03 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -20,6 +20,7 @@ PROFTPD_CONF_OPTS = \
 	--disable-ncurses \
 	--disable-facl \
 	--disable-dso \
+	--enable-sendfile \
 	--enable-shadow \
 	--with-gnu-ld
 
