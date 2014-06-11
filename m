From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 11 Jun 2014 21:12:23 +0200
Subject: [Buildroot] [PATCH 0 of 6 v4] infra: fix dollar signs;
 remove some undefined versions
Message-ID: <patchbomb.1402513943@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This patch series fixes the double sign problem in the inner-xxx-targets
(see description in the patch itself), and makes the following semi-related
changes:
- convert toolchain and toolchain-buildroot package to virtual-package
- change makedevs and mkpasswd to have a 'buildroot' version

The changes are related in the sense that the double dollar signs were
needed to correctly implement the subsequent patches.

I think that the series is ready to be merged now, with Reviews/Acks on all
patches.

As follow-up I plan to do something about the toolchain-external version
which is still 'undefined', and add some extra comments in pkg-generic.mk.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v4: rebase, remove change to toolchain-external from this series
v3: rebase and implement comments on first patch
v2: increase consistency of rules (first two patches)
