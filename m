From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 22:24:10 +0200
Subject: [Buildroot] [git commit] docs/manual: don't mention eglibc,
	mention musl
Message-ID: <20160628203005.5684282037@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff1743ee6d579f8916a46b101b2221917b1343e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the removal of eglibc, it no longer makes sense to talk about
it in the Buildroot manual as one of the supported C libraries. However,
it does make sense to indicate that we support musl.

[Peter: remove extra 'the' as suggested by Yann]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/configure.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 44f5d24..0cd9f82 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -81,9 +81,9 @@ by itself a cross-compilation toolchain, before building the userspace
 applications and libraries for your target embedded system.
 
 This backend supports several C libraries:
-http://www.uclibc.org[uClibc], the
+http://www.uclibc.org[uClibc],
 http://www.gnu.org/software/libc/libc.html[glibc] and
-http://www.eglibc.org[eglibc].
+http://www.musl-libc.org[musl].
 
 Once you have selected this backend, a number of options appear. The
 most important ones allow to:
