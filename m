From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 20 Jun 2014 10:26:15 +0200
Subject: [Buildroot] [PATCH v2 0/3] Add TARGET_FINALIZE_HOOKS
Message-ID: <1403252778-19761-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set add TARGET_FINALIZE_HOOKS and use it for system.mk
recipies.

v2:
- use hooks (Thomas & Arnout)

Fabio Porcedda (3):
  Makefile: target-finalize: add TARGET_FINALIZE_HOOKS
  system: convert "system.mk" recipes to "target-finalize" hooks
  Makefile: do not add to targets common dependencies

 Makefile         |  9 +++----
 system/system.mk | 82 +++++++++++++++++++++++++++++++-------------------------
 2 files changed, 48 insertions(+), 43 deletions(-)

-- 
2.0.0
