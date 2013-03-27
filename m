From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Mar 2013 09:54:59 +0100
Subject: [Buildroot] [git commit] manual: add manual generation date/git
	revision in the manual text
Message-ID: <20130327134626.B8E449B341@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ce3dfb84f35904e0ffbe27b497ee5952189205b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/manual.txt |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index ffb6fb9..9685667 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -8,6 +8,9 @@ The Buildroot user manual
 Buildroot usage and documentation by Thomas Petazzoni. Contributions
 from Karsten Kruse, Ned Ludd, Martin Herren and others.
 
+Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on {docdate}
+{doctime} from git revision {sys:git rev-parse --short HEAD}
+
 image::logo.png[]
 
 :leveloffset: 1
