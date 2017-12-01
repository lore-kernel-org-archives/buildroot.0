From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 21:56:44 +0100
Subject: [Buildroot] [git commit] Merge branch 'next'
Message-ID: <20171201205342.303B680FC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c8dda3e435cfadaffe1f0cc062ad3c8ffbe84a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This merges the next branch accumulated during the 2017.11 release
cycle back into the master branch.

A few conflicts had to be resolved:

 - In the DEVELOPERS file, because Fabrice Fontaine was added as a
   developer for libupnp in master, and for libupnp18 in
   next. Resolution is simple: add him for both.

 - linux/Config.in, because we updated the 4.13.x release used by
   default in master, while we moved to 4.14 in next. Resolution: use
   4.14.

 - package/libupnp/libupnp.hash: a hash for the license file was added
   in master, while the package was bumped into next. Resolution: keep
   the hash for the license file, and keep the hash for the newest
   version of libupnp.

 - package/linux-headers/Config.in.host: default version of the kernel
   headers for 4.13 was bumped to the latest 4.13.x in master, but was
   changed to 4.14 in next. Resolution: use 4.14.

 - package/samba4/: samba was bumped to 4.6.11 in master for security
   reasons, but was bumped to 4.7.3 in next. Resolution: keep 4.7.3.

Patch is too large, so refusing to show it
Patch is too large, so refusing to show it
