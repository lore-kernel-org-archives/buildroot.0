From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Aug 2014 21:41:45 +0200
Subject: [Buildroot] [PATCH 0 of 3 for 2014.08] Manual improvements part 2
Message-ID: <patchbomb.1408477305@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a second set of manual improvements I'm sending out for 2014.08.
Thomas Petazzoni already applied the first part which was actually an RFC,
and following his comments I will send out subsequent patches as soon as
they are available.

As far as structure is concerned, this series covers all I was planning to
change. Content-wise, I will be making more changes, which will be sent as a
third series. At least one change I have to make is regarding the
configuration of busybox/uclibc, which is now easier thanks to the
kconfig-package infrastructure. After that change, I think the manual is in
a good enough shape for the release, and any further changes I can make (see
below) are welcome but not necessary. Do let me know if you think otherwise.

Additional changes I'm planning but may not be ready in time for the
release:
- Rework the 'General Buildroot usage' chapter
- Rework the 'Project-specific customization' chapter.
- Revive the 'Beyond Buildroot' rework patch that has been sent to the list
  a long while back. This will certainly not be ready before the release.


Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Thomas De Schampheleire (3)
  manual/getting started: minor improvements to 'Using Buildroot' section
  manual/user guide: high-level restructuring
  manual/user guide: move tip on configuration searches

 docs/manual/common-usage.txt        |   8 ++++-
 docs/manual/configure.txt           |  46 ++++++++++++++++++++++++--
 docs/manual/customize-store.txt     |   9 +----
 docs/manual/customize-toolchain.txt |  49 -----------------------------
 docs/manual/customize.txt           |  16 ++++-----
 docs/manual/eclipse-integration.txt |   2 +-
 docs/manual/going-further.txt       |   8 ----
 docs/manual/how-buildroot-works.txt |   2 +-
 docs/manual/make-tips.txt           |  12 +------
 docs/manual/manual.txt              |   4 +-
 docs/manual/using.txt               |   5 +-
 docs/manual/working-with.txt        |  16 +--------
 12 files changed, 67 insertions(+), 110 deletions(-)
