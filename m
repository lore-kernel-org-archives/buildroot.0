From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 13 May 2012 12:38:10 +0200
Subject: [Buildroot] [PATCH v2 00/11] RFC: Manual content reorganization
In-Reply-To: <4FAEEFA8.2070005@mind.be>
References: <4FAEEFA8.2070005@mind.be>
Message-ID: <1336905501-9757-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is the second round of the patch series about the manual content.

For further information about the reasons, the objectives and the
new manual organization, please refer to:
http://lists.busybox.net/pipermail/buildroot/2012-March/051952.html


Happy review!
Looking forward to read your comments, suggestions, critics, blames...


Regards,

Sam


Change since v1:
 * Cleanup/fix the prerequesite section


Samuel MARTIN (11):
  manual: rework the whole documentation stub
  manual: rework introduction.txt and add embedded-basics.txt
  manual: add prerequisite.txt
  manual: rework using.txt and update common-usage.txt
  manual: add make-tips.txt
  manual: update working-with.txt
  manual: rework the intro of customize-rootfs.txt
  manual: add troubleshooting.txt
  manual: add writing-rules.txt
  manual: add get-involved.txt
  manual: add contribute.txt

 docs/manual/adding-packages-autotargets.txt  |    6 +-
 docs/manual/adding-packages-cmaketargets.txt |    6 +-
 docs/manual/adding-packages-conclusion.txt   |    2 +-
 docs/manual/adding-packages-directory.txt    |   11 ++-
 docs/manual/adding-packages-gentargets.txt   |    6 +-
 docs/manual/adding-packages-gettext.txt      |    2 +-
 docs/manual/adding-packages-handwritten.txt  |    4 +-
 docs/manual/adding-packages.txt              |    3 +-
 docs/manual/advanced.txt                     |   10 +++
 docs/manual/board-support.txt                |    3 +-
 docs/manual/ccache-support.txt               |    3 +-
 docs/manual/common-usage.txt                 |   81 ++++++++++++++++++
 docs/manual/contribute.txt                   |   63 ++++++++++++++
 docs/manual/customize-busybox-config.txt     |    6 +-
 docs/manual/customize-kernel-config.txt      |    3 +-
 docs/manual/customize-rootfs.txt             |    7 +-
 docs/manual/customize-toolchain.txt          |   10 +--
 docs/manual/customize-uclibc-config.txt      |    4 +-
 docs/manual/customize.txt                    |    2 +-
 docs/manual/developer-guide.txt              |    8 ++
 docs/manual/download-location.txt            |    2 +-
 docs/manual/embedded-basics.txt              |   67 +++++++++++++++
 docs/manual/external-toolchain.txt           |    4 +-
 docs/manual/get-involved.txt                 |   67 +++++++++++++++
 docs/manual/getting.txt                      |    3 +-
 docs/manual/going-further.txt                |    8 ++
 docs/manual/how-buildroot-works.txt          |    2 +-
 docs/manual/introduction.txt                 |   74 +++-------------
 docs/manual/legal-notice.txt                 |    4 +
 docs/manual/make-tips.txt                    |   48 +++++++++++
 docs/manual/manual.txt                       |   21 ++---
 docs/manual/prerequisite.txt                 |   62 ++++++++++++++
 docs/manual/rebuilding-packages.txt          |    6 +-
 docs/manual/starting-up.txt                  |    9 ++
 docs/manual/troubleshooting.txt              |   46 ++++++++++
 docs/manual/using-buildroot-toolchain.txt    |    2 +-
 docs/manual/using.txt                        |  105 ++++-------------------
 docs/manual/working-with.txt                 |   22 +++++
 docs/manual/writing-rules.txt                |  119 ++++++++++++++++++++++++++
 39 files changed, 708 insertions(+), 203 deletions(-)
 create mode 100644 docs/manual/advanced.txt
 create mode 100644 docs/manual/common-usage.txt
 create mode 100644 docs/manual/contribute.txt
 create mode 100644 docs/manual/developer-guide.txt
 create mode 100644 docs/manual/embedded-basics.txt
 create mode 100644 docs/manual/get-involved.txt
 create mode 100644 docs/manual/going-further.txt
 create mode 100644 docs/manual/legal-notice.txt
 create mode 100644 docs/manual/make-tips.txt
 create mode 100644 docs/manual/prerequisite.txt
 create mode 100644 docs/manual/starting-up.txt
 create mode 100644 docs/manual/troubleshooting.txt
 create mode 100644 docs/manual/working-with.txt
 create mode 100644 docs/manual/writing-rules.txt

--
1.7.10.2
