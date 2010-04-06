From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 07 Apr 2010 00:47:50 +0200
Subject: [Buildroot] [PATCH] Fix external toolchain sysroot detection
Message-ID: <20100406224729.23635.86404.stgit@roazhon.bzh.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch should fix the case when the external toolchain was built
by buildroot. It also has the nice side-effect of being much more simpler.

---

Yann E. MORIN (1):
      toolchain: fix using external toolchains built with buildroot


 toolchain/external-toolchain/ext-tool.mk |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

-- 
Signature
