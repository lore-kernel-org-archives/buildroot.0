From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 12 Aug 2014 22:20:05 +0200
Subject: [Buildroot] [PATCH 0 of 8 RFCv2 for 2014.08] manual: restructuring
 and improvements
Message-ID: <patchbomb.1407874805@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series improves the manual by
a. reworking the overall structure
b. improving certain sections wrt clarity and wording

At this point, this is still an RFC as I did not yet go through the entire
manual. Currently, the overall structure is clear, and the Getting started
part is finished. During the rest of the month I will cover the User guide
and Developer guide.
One of the final patches (not yet included) will reorganize the manual
source files themselves. Currently, I'm keeping the current names to ease
reviewing.

It is my goal to make sure this series is in a mergable state before the
release of 2014.08. If you have any comments or objections against these
changes, please let me know as soon as possible...

Thanks for your feedback!


Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Thomas De Schampheleire (8)
  manual: high-level restructuring
  manual: remove 'Events' section
  manual/getting started: rename and move 'Getting involved' section
  manual/getting started: rework 'Community resources' section
  manual/getting started: rework 'System requirements' section
  website/download: update daily snapshot section
  manual/getting started: rework 'Getting Buildroot' section
  manual/getting started: rework 'Using Buildroot' section

 docs/download.html                          |   13 +-
 docs/manual/advanced.txt                    |    2 +-
 docs/manual/appendix.txt                    |    2 -
 docs/manual/beyond-buildroot.txt            |    8 +-
 docs/manual/ccache-support.txt              |    2 +-
 docs/manual/contribute.txt                  |   53 +++++--
 docs/manual/developer-guide.txt             |    2 -
 docs/manual/download-location.txt           |    2 +-
 docs/manual/faq-troubleshooting.txt         |   16 +-
 docs/manual/get-involved.txt                |  146 ++++++-------------
 docs/manual/getting.txt                     |   26 +--
 docs/manual/going-further.txt               |    2 +-
 docs/manual/how-buildroot-works.txt         |    2 +-
 docs/manual/introduction.txt                |    2 +-
 docs/manual/known-issues.txt                |    2 +-
 docs/manual/legal-notice.txt                |    8 +-
 docs/manual/manual.mk                       |    4 +-
 docs/manual/manual.txt                      |   14 +-
 docs/manual/package-make-target.txt         |    2 +-
 docs/manual/prerequisite.txt                |   40 +++--
 docs/manual/starting-up.txt                 |    2 -
 docs/manual/using-buildroot-debugger.txt    |    2 +-
 docs/manual/using-buildroot-development.txt |    2 +-
 docs/manual/using-buildroot-toolchain.txt   |    2 +-
 docs/manual/using.txt                       |   59 ++++---
 docs/manual/working-with.txt                |    2 -
 26 files changed, 196 insertions(+), 221 deletions(-)
