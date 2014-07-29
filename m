From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 09:17:05 +0200
Subject: [Buildroot] [git commit] python-flup: re-add MIT license
Message-ID: <20140729071811.884289D2BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d001e322460fa47786f5790fd15ab367d47ab0e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The MIT license was in the original submission, but I had removed it
since I couldn't find where it was used. It is indeed used in
flup/server/paste_factory.py as noted by the original
submitter. Therefore, this commit adds the MIT license as one of the
licenses of python-flup.

Reported-by: Oli Vogt <oli.vogt.pub01@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-flup/python-flup.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-flup/python-flup.mk b/package/python-flup/python-flup.mk
index 39c6658..5e612bb 100644
--- a/package/python-flup/python-flup.mk
+++ b/package/python-flup/python-flup.mk
@@ -8,7 +8,7 @@ PYTHON_FLUP_VERSION = 1.0.3.dev-20110405
 PYTHON_FLUP_SOURCE = flup-$(PYTHON_FLUP_VERSION).tar.gz
 PYTHON_FLUP_SITE = http://pypi.python.org/packages/source/f/flup
 
-PYTHON_FLUP_LICENSE = BSD-2c
+PYTHON_FLUP_LICENSE = BSD-2c, MIT
 
 PYTHON_FLUP_SETUP_TYPE = setuptools
 
