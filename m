From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2011 09:54:44 +0100
Subject: [Buildroot] [PATCH 2/5] doc: mention how to format the Config.in
	file
In-Reply-To: <cover.1321174391.git.thomas.petazzoni@free-electrons.com>
References: <cover.1321174391.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a829e41c56d4cc0fea0131d7e7bd0002d6ebab5f.1321174391.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index a262a8c..b61eb54 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -24,6 +24,11 @@ config BR2_PACKAGE_LIBFOO
 	  http://foosoftware.org/libfoo/
 ---------------------------
 
+The +bool+ line, +help+ line and other meta-informations about the
+configuration option must be indented with one tab. The help text
+itself but be indented with one tab and two spaces, and it must
+mention the upstream URL of the project.
+
 Of course, you can add other sub-options into a +if
 BR2_PACKAGE_LIBFOO...endif+ statement to configure particular things
 in your software. You can look at examples in other packages. The
-- 
1.7.4.1
