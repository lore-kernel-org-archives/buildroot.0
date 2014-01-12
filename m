From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2014 21:14:16 +0100
Subject: [Buildroot] [git commit] python-nfc: fix autobuild failures
Message-ID: <20140112201447.A28769C44A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b1e84b6e06ddf23c0b1aa9c7bc7798a9d00b7db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes autobuild failures such as the following.

  http://autobuild.buildroot.net/results/2e1/2e11b9e946a854deb28ba144ca7e398a9c996a02/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-nfc/python-nfc-add-setup-py.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
