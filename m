From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 24 Sep 2012 21:57:21 +0200
Subject: [Buildroot] [git commit] genext2fs: update to CVS rev 1.118
Message-ID: <20120925093427.728869970E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa2ab8ac340a6f8e7b625cf55505253500481b96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See http://genext2fs.cvs.sourceforge.net/viewvc/genext2fs/genext2fs/genext2fs.c?view=log
for details.

Numerous bugfixes, large file and filesystem support, rev 1 filesystems,
volume id support, block size, ..

And drop unneeded patches while we're at it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/genext2fs/genext2fs-1.4.1-nosquash.patch   |   14 -
 .../genext2fs-1.4.1-remove_ugly_warnings.patch     |   21 -
 ...genext2fs-update-genext2fs.c-to-rev-1.118.patch | 2971 ++++++++++++++++++++
 3 files changed, 2971 insertions(+), 35 deletions(-)

Patch is too large, so refusing to show it
