From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Oct 2016 13:54:19 +0200
Subject: [Buildroot] [PATCH v11 0/4] Relocatable SDK: preparatory changes
Message-ID: <20161016115423.17881-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Same series as v10, but with a typo fixed!
Sorry for the noise.

Regards,
Samuel


Samuel Martin (4):
  core: split variables definition related to in/out-of-tree build from
    O itself
  core: reorder top-level Makefile and document things
  core: re-enter make if $(CURDIR) or $(O) are not canonical paths
  core: only remove O from MAKEOVERRIDES

 Makefile | 81 ++++++++++++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 59 insertions(+), 22 deletions(-)

--
2.10.0
