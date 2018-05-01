From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 May 2018 11:45:13 +0200
Subject: [Buildroot] [git commit] libid3tag: add hash for license files
Message-ID: <20180501094623.A9BE57FD96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e42390ef13fa7ae9631c9aefa3c4378c80e03d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libid3tag/libid3tag.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libid3tag/libid3tag.hash b/package/libid3tag/libid3tag.hash
index fb02882db7..82ad59d9ac 100644
--- a/package/libid3tag/libid3tag.hash
+++ b/package/libid3tag/libid3tag.hash
@@ -1,2 +1,4 @@
 # Locally computed:
 sha256  63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151  libid3tag-0.15.1b.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  7f12ad28dc075763e91b91bfa60fad04062380011ddad8f6bac21dd7b1f44367  COPYRIGHT
