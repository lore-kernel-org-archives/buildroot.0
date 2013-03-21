From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 21 Mar 2013 22:04:32 +0100
Subject: [Buildroot] [PATCH 1/7] manual: add manual generation date/git
	revision in the manual text
In-Reply-To: <cover.1363899518.git.s.martin49@gmail.com>
References: <cover.1363899518.git.s.martin49@gmail.com>
Message-ID: <67ee82f142320944c966ce062537a34726aea3df.1363899518.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
Thanks to Thomas P. for the suggestion and Lionel O. for the asciidoc
tips.
---
 docs/manual/manual.txt | 3 +++
 1 file changed, 3 insertions(+)

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
1.8.2
