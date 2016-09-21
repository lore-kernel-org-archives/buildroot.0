From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Sep 2016 00:03:01 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: list the a20_olinuxino boards
	under my name
Message-ID: <20160921220318.D1D3282266@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5f041c3308ebb7dfa1ea3a57ea74cec2678e130
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I own a A20 Micro, I contributed the defconfig for it and I test it
still works from time to time.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9a4a336..84e00c8 100644
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
