From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  1 Apr 2018 02:08:18 -0300
Subject: [Buildroot] [PATCH v2 05/37] fs/yaffs2: fix code style
In-Reply-To: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
Message-ID: <20180401050850.5701-6-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename the .mk to follow the convention. The variables inside it already
use the correct name.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - no changes
---
 fs/yaffs2/{yaffs.mk => yaffs2.mk} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename fs/yaffs2/{yaffs.mk => yaffs2.mk} (100%)

diff --git a/fs/yaffs2/yaffs.mk b/fs/yaffs2/yaffs2.mk
similarity index 100%
rename from fs/yaffs2/yaffs.mk
rename to fs/yaffs2/yaffs2.mk
-- 
2.14.1
