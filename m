From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Mar 2018 09:05:26 +0100
Subject: [Buildroot] [git commit] libcoap: add licenses hash
Message-ID: <20180308080759.3701B827C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae8f5b0d440d3cb7b37b69cfe03c26af52111172
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcoap/libcoap.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
index 708ca1b6e7..deb94ecd6d 100644
--- a/package/libcoap/libcoap.hash
+++ b/package/libcoap/libcoap.hash
@@ -1,2 +1,5 @@
 # Locally calculated
 sha256 f7e26dc232c177336474a14487771037a8fb32e311f5ccd076a00dc04b6d7b7a libcoap-v4.1.2.tar.gz
+sha256 28b61fbf3c5477611d7f6ead97d15348934496d27dca815b34d45e622730e72e COPYING
+sha256 d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388 LICENSE.GPL
+sha256 9d5aeec17bdf82369bbe6e89efb07b7b35abefa044ea1d25cb2feeb70df1c208 LICENSE.BSD
