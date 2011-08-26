From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 26 Aug 2011 07:16:23 +0200
Subject: [Buildroot] [git commit] grub: fix patch handling after AUTOTARGETS
	conversion
Message-ID: <20110826051840.67A448CA41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cb6c2c427838a0ba5dc7bb404734574c9ed6b102
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #4093

AUTOTARGETS doesn't handle compressed patches, so the '400' patch did
not get applied.

Fix it by extracting the patch. With this, the '500' patch is no longer
needed.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
