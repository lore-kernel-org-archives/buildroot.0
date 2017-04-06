From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:41:53 +0200
Subject: [Buildroot] [git commit] python-pylibftdi: check hash
Message-ID: <20170406204348.55F2D8274E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35e95bb745f9be48bf60c8c6eb021ce7f8dffd0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently the hash is not checked, returning this message:
WARNING: no hash file for pylibftdi-0.15.0.tar.gz

Rename the .hash file to use the package name.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pylibftdi/{python-libftdi.hash => python-pylibftdi.hash} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/python-pylibftdi/python-libftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
similarity index 100%
rename from package/python-pylibftdi/python-libftdi.hash
rename to package/python-pylibftdi/python-pylibftdi.hash
