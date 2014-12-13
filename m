From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Dec 2014 10:06:02 +0100
Subject: [Buildroot] [git commit] erlang: bump to version 17.4
Message-ID: <20141213090625.DB51F7FC57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41d987dcc186bc3ff46763329247219ca97ddedf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Erlang/OTP 17.4 is a service release on the 17 track with mostly bug
fixes, but it does contain a number of new features and characteristics
improvements as well.

Some highlights of the release are:

  - eldap: Nearly all TCP options are possible to give in the
    eldap:open/2 call.
  - ssh: Added API functions ptty_alloc/3 and ptty_alloc/4, to allocate a
    pseudo tty.
  - ssl: Handle servers that may send an empty SNI extension to the client.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/erlang/erlang.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index ef0e0a2..045c07f 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_VERSION = 17.3
+ERLANG_VERSION = 17.4
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
