From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  1 Feb 2016 23:19:51 +0100
Subject: [Buildroot] [PATCH v2 0/5] Patch file clarification & Co
Message-ID: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

several Buildroot users reportedly asked details about how the patches
bundled with Buildroot are licensed.

Following the discussion during the Buildroot Developer Days today,
this small series is aimed at clarifying patch licensing in the places
where it makes sense: COPYING, the manual and the legal-info output.

This v2 is a refinement of v1 based on the comments received.

Note that patches are not saved by 'make legal-info' in current
Buildroot master, but there's a patchset by Yann E. Morin to add this
feature. Patch 5 of the present series applies to legal-info, and it
only applies on top of Yann's series (it would be useless on master
anyway).

Patches 1-4 apply also on current master.

Luca Ceresoli (5):
  Update copyright year
  docs/manual: slightly clarify patch licensing
  COPYING: add exception about patch licensing
  docs/manual: add section about patch licensing
  legal-info: explicitly state how patches are licensed

 COPYING                          |  8 ++++++++
 Makefile                         |  2 +-
 docs/manual/legal-notice.txt     | 16 ++++++++++++++--
 docs/manual/patch-policy.txt     |  4 ++--
 support/legal-info/README.header |  2 +-
 5 files changed, 26 insertions(+), 6 deletions(-)

-- 
1.9.1
