From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 15:32:02 +0200
Subject: [Buildroot] [git commit] shadowsocks-libev: drop the useless hash
Message-ID: <20180617133051.DD5228395F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e69bce3a5602fa0eaf246a99a4b4e1e69f398e73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit f8d44394777fb9b45befaee3333d974dfe5e745d
("shadowsocks-libev: new package"), when this package was introduced,
the hash for a license file that isn't available in upstream's tarball
was added to the license file. Obviously, this hash serves no purpose,
so drop it.

Signed-off-by: Min Xu <xuminready@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shadowsocks-libev/shadowsocks-libev.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/shadowsocks-libev/shadowsocks-libev.hash b/package/shadowsocks-libev/shadowsocks-libev.hash
index e8be8a8a71..fffe9fddf0 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.hash
+++ b/package/shadowsocks-libev/shadowsocks-libev.hash
@@ -5,4 +5,3 @@ sha256 5521cf623a07fd1e393528516a83acd2b66c5d4bb4535a52662806a6a060c606 shadowso
 sha256 736883f97d44dbec288bb82819f18f4f86d02ae3192f6a9abefa00db76bace41  COPYING
 sha256 c41a4bc2c4c43e4daa3051e77e31b2d5c8500498afaeac6d831d55a4bb8de3fb  libbloom/LICENSE
 sha256 4fa2ada54f8c0410ec243265378242ffe862386d5ac517f8dd30a1911d25ae93  libcork/COPYING
-sha256 4b3adc9ce620fa868f1dda328203dbccbd3e9f5fbafb49c581edc386a504ee1a  libipset/LICENSE.txt
