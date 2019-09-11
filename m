From: Mohana Datta Yelugoti <ymdatta.work@gmail.com>
Date: Wed, 11 Sep 2019 19:17:18 +0530
Subject: [Buildroot] [PATCH] package/python-sip: add hashes for license files
Message-ID: <20190911134718.9327-1-ymdatta.work@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mohana Datta Yelugoti <ymdatta.work@gmail.com>
---
 package/python-sip/python-sip.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-sip/python-sip.hash b/package/python-sip/python-sip.hash
index 8035fc3f49..3a4bd53677 100644
--- a/package/python-sip/python-sip.hash
+++ b/package/python-sip/python-sip.hash
@@ -3,3 +3,6 @@ md5  9124cb8978742685747a5415179a9890		sip-4.19.13.tar.gz
 sha1 acb826ca1a49742d17686cef246cceabcc87e3b9	sip-4.19.13.tar.gz
 # Locally calculated:
 sha256 e353a7056599bf5fbd5d3ff9842a6ab2ea3cf4e0304a0f925ec5862907c0d15e  sip-4.19.13.tar.gz
+sha256 accecbfda71ad4497bce0d451796706e734e405e5ecf3b3f9ee0cc68300a3d9c  LICENSE
+sha256 7ebb61006e46b9e9340dd135d5f4afbbcb1d1d6c6709f74473b35929007b9aeb  LICENSE-GPL2
+sha256 63cb5f5c1ea39b732c495f354f971e40f6db84c567ca5573a68bb65af07741f8  LICENSE-GPL3
-- 
2.17.1
