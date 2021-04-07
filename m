From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 7 Apr 2021 21:16:20 +0200
Subject: [Buildroot] [git commit] package/s6-dns: bump to version 2.3.5.0
Message-ID: <20210407185256.CE15881640@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b14b2844f7d90c29aaadc6136d2e57ffb6cd727e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license hash due to year change.

Refer to the change set described for s6-networking in the announcement:
http://skarnet.org/cgi-bin/archive.cgi?1:mss:1535:lpehbljhhcpaopbnkkbf

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/s6-dns/s6-dns.hash | 4 ++--
 package/s6-dns/s6-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-dns/s6-dns.hash b/package/s6-dns/s6-dns.hash
index 5ee12ae275..2d49077895 100644
--- a/package/s6-dns/s6-dns.hash
+++ b/package/s6-dns/s6-dns.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 415e3e8a8baaa39b3eac57eef8b3023d63bcdb33d9f9b03bcb298fd940589132  s6-dns-2.3.1.1.tar.gz
-sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
+sha256 9f0b71c82cb51e9b7f998978d94c44e5e896fa60105f7233544db539572bb740  s6-dns-2.3.5.0.tar.gz
+sha256 adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index 7384f07244..9ed75bd600 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_DNS_VERSION = 2.3.1.1
+S6_DNS_VERSION = 2.3.5.0
 S6_DNS_SITE = http://skarnet.org/software/s6-dns
 S6_DNS_LICENSE = ISC
 S6_DNS_LICENSE_FILES = COPYING
