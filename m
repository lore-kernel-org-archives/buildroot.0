From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 11 Jan 2012 18:09:21 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.02/shutdown
Message-ID: <cover.1326301656.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

This is an update of the previous patch rework the shutdown policy by calling
the stop function of init scripts.

I also added a mention of such a behaviour in the changes file so that users
can notice it.

Maxime

The following changes since commit 68902f743729b3482bb6bc2ae9d0306aa9c00f65:

  ti-utils: unbreak build after libnl version bump (2011-12-26 19:33:43 +0100)

are available in the git repository at:
  http://free-electrons.com/~maxime/git/buildroot.git for-2012.02/shutdown

Maxime Ripard (2):
      Rework of shutdown policy in inittab
      Update the CHANGES file to mention this new policy

 CHANGES                    |    3 +++
 fs/skeleton/etc/init.d/rcK |   27 +++++++++++++++++++++++++++
 fs/skeleton/etc/inittab    |    3 +--
 3 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100755 fs/skeleton/etc/init.d/rcK

Thanks,
-- 
Maxime Ripard
