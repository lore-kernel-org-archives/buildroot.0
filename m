From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Dec 2012 13:56:08 -0800
Subject: [Buildroot] [git commit] beecrypt: add license information
Message-ID: <20121204215926.0B16899951@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=914274b4e446396c90c4ca4143705b12dc15d238
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <simond@trainfx.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/beecrypt/beecrypt.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index d165aee..a9cf133 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -7,6 +7,8 @@ BEECRYPT_VERSION = 4.2.1
 BEECRYPT_SITE = http://downloads.sourceforge.net/project/beecrypt/beecrypt/$(BEECRYPT_VERSION)
 BEECRYPT_AUTORECONF = YES
 BEECRYPT_INSTALL_STAGING = YES
+BEECRYPT_LICENSE = LGPLv2.1+
+BEECRYPT_LICENSE_FILES = COPYING.LIB
 
 # beecrypt contains C++ code that g++ 4.7 doesn't really
 # like. Upstream does not seem to be really active, so workaround this
