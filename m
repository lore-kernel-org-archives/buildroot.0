From: Fabio Porcedda <fabio.porcedda@telit.com>
Date: Fri, 27 Jun 2014 14:15:54 +0200
Subject: [Buildroot] [PATCH v3 0/5] Add TARGET_FINALIZE_HOOKS
Message-ID: <1403871359-18849-1-git-send-email-fabio.porcedda@telit.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set add TARGET_FINALIZE_HOOKS and use it for system.mk
recipies.

The changelog is on each patch.

Best regards
Fabio Porcedda (5):
  Makefile: target-finalize: add TARGET_FINALIZE_HOOKS
  system: convert "system.mk" recipes to "target-finalize" hooks
  Makefile: convert "toolchain-eclipse-register" to a hook
  Makefile: convert "target-generatelocales" to a hook
  Makefile: do not add to targets common dependencies

 Makefile         | 88 +++++++++++++++++++++++++++-----------------------------
 system/system.mk | 80 +++++++++++++++++++++++++++------------------------
 2 files changed, 85 insertions(+), 83 deletions(-)

-- 
2.0.0
