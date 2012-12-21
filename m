From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 21 Dec 2012 11:36:28 +0100
Subject: [Buildroot] [PATCH v2 0/2] Makefile: add toolchain target
Message-ID: <1356086190-906-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
this patch set is to add a toolchain target to be able
to build only the toolchain right after a defconfig or a clean.

Best regards

Fabio Porcedda (2):
  Makefile: rename cross target -> toolchain
  Makefile: use toolchain target in the world target

 Makefile | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
1.8.0
