From: Min Xu <xuminready@gmail.com>
Date: Mon, 11 Jun 2018 11:18:21 -0700
Subject: [Buildroot] [PATCH v2 1/3] shadowsocks-libev: Drop the useless hash.
Message-ID: <20180611181823.2722-1-xuminready@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Min Xu <xuminready@gmail.com>
---
 package/shadowsocks-libev/shadowsocks-libev.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/shadowsocks-libev/shadowsocks-libev.hash b/package/shadowsocks-libev/shadowsocks-libev.hash
index e8be8a8..fffe9fd 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.hash
+++ b/package/shadowsocks-libev/shadowsocks-libev.hash
@@ -5,4 +5,3 @@ sha256 5521cf623a07fd1e393528516a83acd2b66c5d4bb4535a52662806a6a060c606 shadowso
 sha256 736883f97d44dbec288bb82819f18f4f86d02ae3192f6a9abefa00db76bace41  COPYING
 sha256 c41a4bc2c4c43e4daa3051e77e31b2d5c8500498afaeac6d831d55a4bb8de3fb  libbloom/LICENSE
 sha256 4fa2ada54f8c0410ec243265378242ffe862386d5ac517f8dd30a1911d25ae93  libcork/COPYING
-sha256 4b3adc9ce620fa868f1dda328203dbccbd3e9f5fbafb49c581edc386a504ee1a  libipset/LICENSE.txt
-- 
2.11.0
