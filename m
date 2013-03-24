From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Mar 2013 23:50:37 +0100
Subject: [Buildroot] [PATCH 02/14] manual: add manual generation date/git
	revision in the manual text
In-Reply-To: <cover.1364165310.git.yann.morin.1998@free.fr>
References: <cover.1364165310.git.yann.morin.1998@free.fr>
Message-ID: <525ee903942b928afecdcd35134255f9d0cc673a.1364165310.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
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
-- 
1.7.2.5
