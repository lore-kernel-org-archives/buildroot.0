From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Apr 2014 22:40:45 +0200
Subject: [Buildroot] [git commit] erlang: bump version to 17.0
Message-ID: <20140410204504.40EFF9C483@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00856e2ba2e9a30dba00db5503231e5a35157b24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Erlang/OTP 17.0 is a new major release with new features, characteristics
improvements, as well as some minor incompatibilities.

Some highlights of the release are:
  - Erlang/OTP has been ported to the realtime operating system OSE.
  - Maps, a new dictionary data type (experimental)
  - A more natural mapping from ASN.1 OCTET STRING and BIT STRING to Erlang
    types, and other ASN.1 improvements and optimizations
  - The {active, N} socket option for TCP, UDP, and SCTP
  - A new (optional) scheduler utilization balancing mechanism
  - Migration of memory carriers has been enabled by default on all ERTS
    internal memory allocators
  - Increased garbage collection tenure rate
  - Experimental "dirty schedulers" functionality
  - Funs can now be given names
  - Miscellaneous unicode support enhancements
  - A new version scheme for OTP its applications has been introduced

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/erlang/erlang.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 1572731..1278682 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_VERSION = R16B03-1
+ERLANG_VERSION = 17.0
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
