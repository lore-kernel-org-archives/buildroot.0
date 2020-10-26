From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Oct 2020 09:31:02 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: replace Trent Piepho's e-mail
 address
Message-ID: <20201026083103.497368-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trent's e-mail address is no longer working:

<tpiepho@impinj.com>: host us-smtp-inbound-2.mimecast.com[205.139.110.221]
    said: 550 Invalid Recipient -
    https://community.mimecast.com/docs/DOC-1369#550
    [7R954rMIM8GCM0FMERvPAg.us536] (in reply to RCPT TO command)

Use another e-mail that Trent has recently used on the mailing list.

Cc: Trent Piepho <trent.piepho@synapse.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 123ffbf033..f39e745217 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2616,7 +2616,7 @@ F:	package/waf/
 F:	support/testing/tests/package/test_crudini.py
 F:	support/testing/tests/package/test_redis.py
 
-N:	Trent Piepho <tpiepho@impinj.com>
+N:	Trent Piepho <trent.piepho@synapse.com>
 F:	package/libp11/
 
 N:	Tudor Holton <buildroot@tudorholton.com>
-- 
2.26.2
