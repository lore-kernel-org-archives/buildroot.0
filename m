From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 22:17:00 +0100
Subject: [Buildroot] [git commit] manual: $(BR2_EXTERNAL)/{Config.in,
	external.mk} are mandatory
Message-ID: <20140208212130.0345F9C8B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6dd52bf8deb806fa52e154fa92b93f750160b019
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The manual is a bit vague about whether Config.in and external.mk
are mandatory or optional.

Make it explicit in the manual that they are mandatory.

Reported-by: J??r??my Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize-outside-br.txt |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 19257e6..585eedf 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -83,6 +83,7 @@ Or disable the usage of external definitions:
    logic. Buildroot automatically includes +BR2_EXTERNAL/Config.in+ to
    make it appear in the top-level configuration menu, and includes
    +BR2_EXTERNAL/external.mk+ with the rest of the makefile logic.
+   Providing those two files is mandatory, but they can be empty.
 +
 The main usage of this is to store package recipes. The recommended
    way to do this is to write a +BR2_EXTERNAL/Config.in+ that looks
