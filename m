From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 21 Sep 2016 23:43:01 +0200
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: list the a20_olinuxino boards
	under my name
In-Reply-To: <1474494181-10313-1-git-send-email-luca@lucaceresoli.net>
References: <1474494181-10313-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1474494181-10313-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I own a A20 Micro, I contributed the defconfig for it and I test it
still works from time to time.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9a4a3364c075..84e00c87414b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -872,6 +872,8 @@ F:	package/ti-sgx-km/
 F:	package/ti-sgx-um/
 
 N:	Luca Ceresoli <luca@lucaceresoli.net>
+F:	board/olimex/a20_olinuxino/
+F:	configs/olimex_a20_olinuxino_*
 F:	package/agentpp/
 F:	package/exim/
 F:	package/libpjsip/
-- 
2.7.4
