From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Mar 2012 13:47:27 +0100
Subject: [Buildroot] [git commit] apply-patches.sh: add recursivity when
	scanning patchdir
Message-ID: <20120321124839.73E1F95418@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64ac7199525f3dbd0ce49f7ec31715a2a1b63725
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recursivity is needed with some tarballs containing debian patches:
