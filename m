From: Nigel Kukard <nkukard@lbsd.net>
Date: Mon, 21 Dec 2009 07:18:31 +0000
Subject: [Buildroot] [pull request] Pull request for branch e2fsprogs-uuid
Message-ID: <cover.1261379909.git.nkukard@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 14aa5ee54f33d05a0bd01f21635e095ba07f83ec:
  Peter Korsgaard (1):
        mtd-utils: move phony dependencies to toplevel mtd-host target

are available in the git repository at:

  git://git.busybox.net/~nkukard/git/buildroot e2fsprogs-uuid

Nigel Kukard (1):
      Install uuid.h into staging a some other apps like xfsprogs need it

 package/e2fsprogs/e2fsprogs.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

Thanks,
-- 
Nigel Kukard
