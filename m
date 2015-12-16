From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 23:44:03 +0100
Subject: [Buildroot] [git commit] manual: clarify policy when updating a
	package patch
Message-ID: <20151216224416.9A544822DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aafff45965b44344eb1207847bc40ca60c27083d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Renaud AUBIN <root@renaud.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/patch-policy.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 6e27e71..0b4604e 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -106,6 +106,10 @@ upstream SCM software to generate the patch set.
 Otherwise, concatenate the header with the output of the
 +diff -purN package-version.orig/ package-version/+ command.
 
+If you update an existing patch (e.g. when bumping the package version),
+make sure the existing From header and Signed-off-by tags are not
+removed, but do update the rest of the patch comment when appropriate.
+
 At the end, the patch should look like:
 
 ---------------
