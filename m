From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Oct 2020 22:10:28 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: replace Trent Piepho's e-mail
 address
Message-ID: <20201026205812.9650D8625E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c20802d4b5de5836b2ab6000a4c5e273711a8aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
index ba865010d1..ceb9cc9160 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2608,7 +2608,7 @@ F:	package/waf/
 F:	support/testing/tests/package/test_crudini.py
 F:	support/testing/tests/package/test_redis.py
 
-N:	Trent Piepho <tpiepho@impinj.com>
+N:	Trent Piepho <trent.piepho@synapse.com>
 F:	package/libp11/
 
 N:	Tudor Holton <buildroot@tudorholton.com>
