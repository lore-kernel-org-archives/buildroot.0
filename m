From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 12:05:11 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] tcpdump: security bump to
	version 4.9.2
Message-ID: <20170921095847.8D9A680225@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74d64007d502ec2bb363cb4cb71b003a86938464
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes the following security issues (descriptions not public yet):

    Fix buffer overflow vulnerabilities:
      CVE-2017-11543 (SLIP)
      CVE-2017-13011 (bittok2str_internal)
    Fix infinite loop vulnerabilities:
      CVE-2017-12989 (RESP)
      CVE-2017-12990 (ISAKMP)
      CVE-2017-12995 (DNS)
      CVE-2017-12997 (LLDP)
    Fix buffer over-read vulnerabilities:
      CVE-2017-11541 (safeputs)
      CVE-2017-11542 (PIMv1)
      CVE-2017-12893 (SMB/CIFS)
      CVE-2017-12894 (lookup_bytestring)
      CVE-2017-12895 (ICMP)
      CVE-2017-12896 (ISAKMP)
      CVE-2017-12897 (ISO CLNS)
      CVE-2017-12898 (NFS)
      CVE-2017-12899 (DECnet)
      CVE-2017-12900 (tok2strbuf)
      CVE-2017-12901 (EIGRP)
      CVE-2017-12902 (Zephyr)
      CVE-2017-12985 (IPv6)
      CVE-2017-12986 (IPv6 routing headers)
      CVE-2017-12987 (IEEE 802.11)
      CVE-2017-12988 (telnet)
      CVE-2017-12991 (BGP)
      CVE-2017-12992 (RIPng)
      CVE-2017-12993 (Juniper)
      CVE-2017-11542 (PIMv1)
      CVE-2017-11541 (safeputs)
      CVE-2017-12994 (BGP)
      CVE-2017-12996 (PIMv2)
      CVE-2017-12998 (ISO IS-IS)
      CVE-2017-12999 (ISO IS-IS)
      CVE-2017-13000 (IEEE 802.15.4)
      CVE-2017-13001 (NFS)
      CVE-2017-13002 (AODV)
      CVE-2017-13003 (LMP)
      CVE-2017-13004 (Juniper)
      CVE-2017-13005 (NFS)
      CVE-2017-13006 (L2TP)
      CVE-2017-13007 (Apple PKTAP)
      CVE-2017-13008 (IEEE 802.11)
      CVE-2017-13009 (IPv6 mobility)
      CVE-2017-13010 (BEEP)
      CVE-2017-13012 (ICMP)
      CVE-2017-13013 (ARP)
      CVE-2017-13014 (White Board)
      CVE-2017-13015 (EAP)
      CVE-2017-11543 (SLIP)
      CVE-2017-13016 (ISO ES-IS)
      CVE-2017-13017 (DHCPv6)
      CVE-2017-13018 (PGM)
      CVE-2017-13019 (PGM)
      CVE-2017-13020 (VTP)
      CVE-2017-13021 (ICMPv6)
      CVE-2017-13022 (IP)
      CVE-2017-13023 (IPv6 mobility)
      CVE-2017-13024 (IPv6 mobility)
      CVE-2017-13025 (IPv6 mobility)
      CVE-2017-13026 (ISO IS-IS)
      CVE-2017-13027 (LLDP)
      CVE-2017-13028 (BOOTP)
      CVE-2017-13029 (PPP)
      CVE-2017-13030 (PIM)
      CVE-2017-13031 (IPv6 fragmentation header)
      CVE-2017-13032 (RADIUS)
      CVE-2017-13033 (VTP)
      CVE-2017-13034 (PGM)
      CVE-2017-13035 (ISO IS-IS)
      CVE-2017-13036 (OSPFv3)
      CVE-2017-13037 (IP)
      CVE-2017-13038 (PPP)
      CVE-2017-13039 (ISAKMP)
      CVE-2017-13040 (MPTCP)
      CVE-2017-13041 (ICMPv6)
      CVE-2017-13042 (HNCP)
      CVE-2017-13043 (BGP)
      CVE-2017-13044 (HNCP)
      CVE-2017-13045 (VQP)
      CVE-2017-13046 (BGP)
      CVE-2017-13047 (ISO ES-IS)
      CVE-2017-13048 (RSVP)
      CVE-2017-13049 (Rx)
      CVE-2017-13050 (RPKI-Router)
      CVE-2017-13051 (RSVP)
      CVE-2017-13052 (CFM)
      CVE-2017-13053 (BGP)
      CVE-2017-13054 (LLDP)
      CVE-2017-13055 (ISO IS-IS)
      CVE-2017-13687 (Cisco HDLC)
      CVE-2017-13688 (OLSR)
      CVE-2017-13689 (IKEv1)
      CVE-2017-13690 (IKEv2)
      CVE-2017-13725 (IPv6 routing headers)

While we're at it, add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 478ee139b2c34d34ec64f1a975c1b18dfbbd36d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpdump/tcpdump.hash | 5 +++--
 package/tcpdump/tcpdump.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index 4eedc1c..0eb56e6 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,2 +1,3 @@
-# Locally calculated after checking pgp signature at http://www.tcpdump.org/release/tcpdump-4.9.1.tar.gz.sig
-sha256 f9448cf4deb2049acf713655c736342662e652ef40dbe0a8f6f8d5b9ce5bd8f3  tcpdump-4.9.1.tar.gz
+# Locally calculated after checking pgp signature at http://www.tcpdump.org/release/tcpdump-4.9.2.tar.gz.sig
+sha256 798b3536a29832ce0cbb07fafb1ce5097c95e308a6f592d14052e1ef1505fe79  tcpdump-4.9.2.tar.gz
+sha256 9b03d5d13e66d6de02a4bb2d0dd1cb9f41808d045962cdcc42350d5291b141a1  LICENSE
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index ac710b8..7bea4bf 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.9.1
+TCPDUMP_VERSION = 4.9.2
 TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3c
 TCPDUMP_LICENSE_FILES = LICENSE
