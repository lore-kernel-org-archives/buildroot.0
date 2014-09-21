From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 21:16:03 +0200
Subject: [Buildroot] [git commit] erlang: bump to version 17.3
Message-ID: <20140921191712.E817A9D529@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e506a980da3649947dd06721b0ed7f6c378c7e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Erlang/OTP 17.3 is a service release on the 17 track with mostly bug
fixes, but it does contain a number of new features and characteristics
improvements as well.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang/erlang.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 5474952..6f62933 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_VERSION = 17.1
+ERLANG_VERSION = 17.3
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
