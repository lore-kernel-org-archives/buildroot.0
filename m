From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Nov 2011 21:28:11 +0100
Subject: [Buildroot] [git commit] doc: mention how to format the Config.in
	file
Message-ID: <20111113203424.1FCC88F314@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d031a031bdfbccec41a5d7c4c566765b4bb4b6a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: s/but/should as suggested by Michael S. Zick]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-directory.txt |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index a262a8c..2e8786a 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -24,6 +24,11 @@ config BR2_PACKAGE_LIBFOO
 	  http://foosoftware.org/libfoo/
 ---------------------------
 
+The +bool+ line, +help+ line and other meta-informations about the
+configuration option must be indented with one tab. The help text
+itself should be indented with one tab and two spaces, and it must
+mention the upstream URL of the project.
+
 Of course, you can add other sub-options into a +if
 BR2_PACKAGE_LIBFOO...endif+ statement to configure particular things
 in your software. You can look at examples in other packages. The
