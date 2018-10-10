From: Artyom Panfilov <apanfilov@spectracom.com>
Date: Wed, 10 Oct 2018 21:01:45 +0000
Subject: [Buildroot] [PATCH 1/1] package/ntp: fix md5sum.
Message-ID: <20181010210137.12720-1-apanfilov@spectracom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Artem Panfilov <apanfilov@spectracom.com>
---
 package/ntp/ntp.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index 02dbaffcba..2fd8a8322b 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,5 +1,5 @@
-# From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p11.tar.gz.md5
-md5 00950ca2855579541896513e78295361  ntp-4.2.8p11.tar.gz
+# From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p12.tar.gz.md5
+md5 1522d66574bae14abb2622746dad2bdc  ntp-4.2.8p12.tar.gz
 # Calculated based on the hash above
 sha256 709b222b5013d77d26bfff532b5ea470a8039497ef29d09363931c036cb30454  ntp-4.2.8p12.tar.gz
 sha256 62c87b269365b38b55359b16dfde7ec28c683c722ef489db90afd0f2e478e4a1  COPYRIGHT
-- 
2.17.1
