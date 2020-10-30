From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Oct 2020 09:48:36 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] DEVELOPERS: replace Trent
 Piepho's e-mail address
Message-ID: <20201030085402.5FDC57FCD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e44e80e09bdbbb8861b770b09fe27d33a823086
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Trent's e-mail address is no longer working:

<tpiepho@impinj.com>: host us-smtp-inbound-2.mimecast.com[205.139.110.221]
    said: 550 Invalid Recipient -
    https://community.mimecast.com/docs/DOC-1369#550
    [7R954rMIM8GCM0FMERvPAg.us536] (in reply to RCPT TO command)

Use another e-mail that Trent has recently used on the mailing list.

Cc: Trent Piepho <trent.piepho@synapse.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1c20802d4b5de5836b2ab6000a4c5e273711a8aa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index acc754fc84..571413279e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2568,7 +2568,7 @@ F:	package/waf/
 F:	support/testing/tests/package/test_crudini.py
 F:	support/testing/tests/package/test_redis.py
 
-N:	Trent Piepho <tpiepho@impinj.com>
+N:	Trent Piepho <trent.piepho@synapse.com>
 F:	package/libp11/
 
 N:	Tudor Holton <buildroot@tudorholton.com>
