From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue,  1 Mar 2016 12:01:03 +0100
Subject: [Buildroot] [PATCH v4] Patch file clarification & Co
Message-ID: <1456830064-15398-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

several Buildroot users reportedly asked details about how the patches
bundled with Buildroot are licensed.

Following the discussion during the latest Buildroot Developer Days, a
clarification has already been applied to COPYING.

The present patch adds the same clarification to the manual.

I removed the last patch of v2 ("legal-info: explicitly state how
patches are licensed"): it will only makes sense after Yann's
improvements to save the patches in legal-info will be applied. When
this happens, I'll take care to resend it.

Luca Ceresoli (1):
  docs/manual: add section about patch licensing

 docs/manual/legal-notice.txt | 17 +++++++++++++++--
 docs/manual/patch-policy.txt |  2 +-
 2 files changed, 16 insertions(+), 3 deletions(-)

-- 
1.9.1
