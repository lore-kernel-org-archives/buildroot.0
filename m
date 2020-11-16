From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 17:15:24 +0100
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: drop Trent Piepho
Message-ID: <20201117203829.ADBF47FB0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ceae1b2ed4e16bc7b06c6473e4b1aa34a093a80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We change Trent's e-mail address in commit
1c20802d4b5de5836b2ab6000a4c5e273711a8aa, but it turns out the new one
also doesn't work:

<trent.piepho@synapse.com>: host
    synapse-com.mail.protection.outlook.com[104.47.57.138] said: 550 5.4.1
    Recipient address rejected: Access denied. AS(201806281)
    [DM6NAM11FT063.eop-nam11.prod.protection.outlook.com] (in reply to RCPT TO
    command)

So let's drop Trent entirely, which orphans the libp11 package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6b8083eb47..1900538608 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2606,9 +2606,6 @@ F:	package/waf/
 F:	support/testing/tests/package/test_crudini.py
 F:	support/testing/tests/package/test_redis.py
 
-N:	Trent Piepho <trent.piepho@synapse.com>
-F:	package/libp11/
-
 N:	Tudor Holton <buildroot@tudorholton.com>
 F:	package/openjdk/
 
