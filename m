From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Oct 2014 20:54:45 +0200
Subject: [Buildroot] [git commit] bash: add more security patches
Message-ID: <20141003185449.DB6609D80C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e18438a70057bbec5ccf2009f262be153047e9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apply new patches for a buffer overflow fix (pl28) and an invalid memory
access (pl29).
Rename combined patchlevel patch to be more graphic about the range.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...level27.patch => bash-001-patchlevel1-27.patch} |    0
 package/bash/bash-002-patchlevel28.patch           | 2270 ++++++++++++++++++++
 package/bash/bash-003-patchlevel29.patch           |   64 +
 3 files changed, 2334 insertions(+), 0 deletions(-)

Patch is too large, so refusing to show it
