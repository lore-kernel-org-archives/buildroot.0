From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 23 Apr 2014 10:39:22 +0200
Subject: [Buildroot] [PATCH v5 0/2] Miscellauneus patches
Message-ID: <1398242364-4644-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Some miscellaneus patches.

v5:
 - drop already merged patches
 - rebase
 - patch show-targets: remove the refactor code to easy up the merge

v4:
 - remove the already merged patch
 - rebase
 - add a new patch
 - change order to put the already acked patch at start
 - luajit patch: add a comment
v3:
 - remove already merged patches
 - add acked-by tags
 - fix a typo
v2:
 - Add three patches
 - Remove the already merged patch

Best regards

Fabio Porcedda (2):
  Makefile: fix coding style regarding the '=' sign
  Makefile: let show-targets prints also the dependencies

 Makefile | 200 +++++++++++++++++++++++++++++++--------------------------------
 1 file changed, 100 insertions(+), 100 deletions(-)

-- 
1.8.3.2
