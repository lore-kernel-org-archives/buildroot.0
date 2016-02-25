From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 25 Feb 2016 12:51:13 +0100
Subject: [Buildroot] [PATCH v3 0/2] Patch file clarification & Co
Message-ID: <1456401075-16948-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

several Buildroot users reportedly asked details about how the patches
bundled with Buildroot are licensed.

Following the discussion during the latest Buildroot Developer Days,
this small series is aimed at clarifying patch licensing in the places
where it makes sense: COPYING, the manual and the legal-info output.

This v3 is a refinement of v2 based on the comments received.

The first two patches of v2 have been applied on master in the
meanwhile, and are not repeated here.

I also removed the last patch of v2 ("legal-info: explicitly state how
patches are licensed"): it will only makes sense after Yann's
improvements to save the patches in legal-info will be applied. When
this happens, I'll take care to resend it.


Luca Ceresoli (2):
  COPYING: add exception about patch licensing
  docs/manual: add section about patch licensing

 COPYING                      | 16 ++++++++++++++++
 docs/manual/legal-notice.txt | 17 +++++++++++++++--
 docs/manual/patch-policy.txt |  2 +-
 3 files changed, 32 insertions(+), 3 deletions(-)

-- 
1.9.1
