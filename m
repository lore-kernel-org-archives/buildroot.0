From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Mar 2014 09:41:27 +0100
Subject: [Buildroot] [git commit] wireshark: bump to version 1.10.6
Message-ID: <20140308084156.D82609BC75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8fe9511792b3fb841b2d51317e5c70ae9776475
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following vulnerabilities have been fixed.
     * [1]wnpa-sec-2014-01
       The NFS dissector could crash. Discovered by Moshe Kaplan.
       ([2]Bug 9672)
       Versions affected: 1.10.0 to 1.10.5, 1.8.0 to 1.8.12
       [3]CVE-2014-2281
     * [4]wnpa-sec-2014-02
       The M3UA dissector could crash. Discovered by Laurent
       Butti. ([5]Bug 9699)
       Versions affected: 1.10.0 to 1.10.5
       [6]CVE-2014-2282
     * [7]wnpa-sec-2014-03
       The RLC dissector could crash. ([8]Bug 9730)
       Versions affected: 1.10.0 to 1.10.5, 1.8.0 to 1.8.12
       [9]CVE-2014-2283
     * [10]wnpa-sec-2014-04
       The MPEG file parser could overflow a buffer. Discovered by
       Wesley Neelen. ([11]Bug 9843)
       Versions affected: 1.10.0 to 1.10.5, 1.8.0 to 1.8.12
       [12]CVE-2014-2299

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/wireshark.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 1944b08..62dad8a 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 1.10.5
+WIRESHARK_VERSION = 1.10.6
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
