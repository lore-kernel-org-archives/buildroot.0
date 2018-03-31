From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:30 -0300
Subject: [Buildroot] [PATCH 05/36] fs/yaffs2: fix code style
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-6-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename the .mk to follow the convention. The variables inside it already
use the correct name.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
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
