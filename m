From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 15:19:43 +0200
Subject: [Buildroot] [git commit] README: mention 'make list-defconfigs'
Message-ID: <20150404132028.82A947FA53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33bb2822cd2f1567924edb7eb719c6a836a7ac1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

'make list-defconfigs' is probably one of the more useful things
to get started quickly.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 README |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

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
