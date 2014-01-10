From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 10 Jan 2014 14:55:01 +0000
Subject: [Buildroot] [PATCH] python-nfc: fix autobuild failures
Message-ID: <1389365701-12078-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Fixes autobuild failures such as the following.

  http://autobuild.buildroot.net/results/2e1/2e11b9e946a854deb28ba144ca7e398a9c996a02/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/python-nfc/python-nfc-add-setup-py.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-nfc/python-nfc-add-setup-py.patch b/package/python-nfc/python-nfc-add-setup-py.patch
index 307b749..5a51452 100644
--- a/package/python-nfc/python-nfc-add-setup-py.patch
+++ b/package/python-nfc/python-nfc-add-setup-py.patch
@@ -22,5 +22,5 @@ Index: b/setup.py
 +      author_email='stephen.tiedemann at googlemail.com',
 +      url='https://launchpad.net/nfcpy',
 +      packages=['nfc', 'nfc/dev', 'nfc/llcp', 'nfc/ndef',
-+                'nfc/npp', 'nfc/snep'],
++                'nfc/snep'],
 +      )
-- 
1.8.3.2
