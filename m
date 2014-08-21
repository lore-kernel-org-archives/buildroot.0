From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 21 Aug 2014 22:25:42 +0200
Subject: [Buildroot] [PATCH v2 0/6] gendoc infra refactoring
Message-ID: <1408652748-14708-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

2nd round of this short series about gendoc.
The major change concerns the xsltproc workaround.

Regards,


Samuel Martin (6):
  gendoc infra: cosmetic fixes
  gendoc infra: move manual build location into $(BUILD_DIR)/manual
  gendoc infra: avoid a2x warning
  gendoc infra: disable pdf manual generation
  gendoc infra: Remove the manual* target from .PHONY
  gendoc infra: Move the manual-clean target outside of the infra

 docs/manual/manual.mk | 80 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 66 insertions(+), 14 deletions(-)

--
2.1.0
