From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Mar 2015 20:57:13 +0100
Subject: [Buildroot] [PATCH] README: mention 'make list-defconfigs'
In-Reply-To: <1426967388-559-5-git-send-email-arnout@mind.be>
References: <1426967388-559-5-git-send-email-arnout@mind.be>
Message-ID: <1426967833-1188-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

'make list-defconfigs' is probably one of the more useful things
to get started quickly.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 README | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/README b/README
index a7dae24..e863f0e 100644
--- a/README
+++ b/README
@@ -15,6 +15,9 @@ To build and use the buildroot stuff, do the following:
 
 You do not need to be root to build or run buildroot.  Have fun!
 
+Buildroot comes with a basic configuration for a number of boards. Run
+'make list-defconfigs' to view the list of provided configurations.
+
 Please feed suggestions, bug reports, insults, and bribes back to the
 buildroot mailing list: buildroot at buildroot.org
 You can also find us on #buildroot on Freenode IRC.
-- 
2.1.4
