From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 07:55:22 +0200
Subject: [Buildroot] [git commit] fs/yaffs2: fix code style
Message-ID: <20180401055524.13916811D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c90c109cbd629d664a965aa1690c3ef2b90ba02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rename the .mk to follow the convention. The variables inside it already
use the correct name.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/yaffs2/{yaffs.mk => yaffs2.mk} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/fs/yaffs2/yaffs.mk b/fs/yaffs2/yaffs2.mk
similarity index 100%
rename from fs/yaffs2/yaffs.mk
rename to fs/yaffs2/yaffs2.mk
