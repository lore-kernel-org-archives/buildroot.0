From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 16:21:40 +0200
Subject: [Buildroot] [PATCH 0/3] add defconfig and python unittest to
Message-ID: <20190804142143.10923-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch extends support of getdeveloperlib to defconfigs and python
runtime tests.

This allows to follow more files from the DEVELOPERS file.

Victor Huesca (3):
  utils/getdeveloperlib: add some debug informations
  utils/getdeveloperlib.py: add runtime test
  utils/getdeveloperlib.py: add defconfigs

 utils/getdeveloperlib.py | 83 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

-- 
2.21.0
