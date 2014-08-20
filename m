From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 20 Aug 2014 12:03:18 +0200
Subject: [Buildroot] [PATCH 0/6] manual: gendoc infra refactoring
Message-ID: <1408529004-18632-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This short series about the gendoc infrastructure fixes the bugs
recently found in it [1], and slightly clean it up.

Regards,

[1] http://lists.busybox.net/pipermail/buildroot/2014-August/104390.html

Samuel Martin (6):
  gendoc infra: cosmetic fixes
  gendoc infra: move manual build location into $(BUILD_DIR)/manual
  gendoc infra: avoid a2x warning
  gendoc infra: disable pdf manual generation
  gendoc infra: Remove the manual* target from .PHONY
  gendoc infra: Move the manual-clean target outside of the infra

 docs/manual/manual.mk | 101 ++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 86 insertions(+), 15 deletions(-)

--
2.0.4
