From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:34 -0000
Subject: [Buildroot] [git commit] package/tpm2-totp: bump to version 0.1.2
Message-ID: <20190903133617.32EA88A5E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3192ad33c48bb6e4c6ed64fa4e5f1c6653b9a5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches; issues fixed upstream.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...mat-string-warnings-when-building-for-32b.patch | 60 ----------------------
 ...pilation-failure-due-to-variable-may-be-u.patch | 42 ---------------
 package/tpm2-totp/tpm2-totp.hash                   |  2 +-
 package/tpm2-totp/tpm2-totp.mk                     |  2 +-
 4 files changed, 2 insertions(+), 104 deletions(-)

Patch is too large, so refusing to show it
