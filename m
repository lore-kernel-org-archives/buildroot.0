From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 10 Dec 2020 23:07:22 +0100
Subject: [Buildroot] [PATCH v1 25/31] package/qt5webkit-examples: change
 hash file license marker
In-Reply-To: <20201210220726.22216-1-ps.report@gmx.net>
References: <20201210220726.22216-1-ps.report@gmx.net>
Message-ID: <20201210220726.22216-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chnage hash file license marker to the more usual 'Hashes for
license files' text.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5webkit-examples/qt5webkit-examples.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
index 736dbef5e9..ea64f6f14e 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.hash
@@ -1,7 +1,7 @@
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-examples-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256  e4ce4de6b468243abad2baabbe8ddfb05d25b186529bfe88cb8662fc983f54d0  qtwebkit-examples-opensource-src-5.9.1.tar.xz
 
-# Locally computed
+# Hashes for license files:
 sha256  a3db6c7f3027aa27489c25a2fa259185cdee945780c32e01c60cbfabf4743b6c  LICENSE.LGPLv21
 sha256  04505ee290cbe7b29b3766e00ff81987e84658f620cb43bd6e7bb52ee4234e1b  LICENSE.LGPLv3
 sha256  6c3f3c31b93985f1b93bfbb35fb609d37281697d0efc220c9f91cf4b59eaabde  LICENSE.GPLv2
-- 
2.29.2
