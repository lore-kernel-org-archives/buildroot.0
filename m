From: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
Date: Thu, 11 Feb 2016 16:48:20 +0530
Subject: [Buildroot] [PATCH V7] package/nvme: new package
In-Reply-To: <56BBA4C0.4020304@mind.be>
References: <20160121052928.8568.3019.stgit@localhost.localdomain>
 <56BBA4C0.4020304@mind.be>
Message-ID: <56BC6DFC.3020403@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for the review comments
updated all your comments and sent new version of Patch.

On 02/11/2016 02:29 AM, Arnout Vandecappelle wrote:
> diff --git a/package/nvme/0001-NVME-Makefile-cleanup.patch b/package/nvme/0001-NVME-Makefile-cleanup.patch
> new file mode 100644
> index 0000000..74beac9
> --- /dev/null
> +++ b/package/nvme/0001-NVME-Makefile-cleanup.patch
> @@ -0,0 +1,25 @@
> +From 985a18605f8decd766370a7d9873c77c16b9253c Mon Sep 17 00:00:00 2001
> +From: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
> +Date: Mon, 18 Jan 2016 12:40:00 +0530
> +Subject: [PATCH V2] NVME Makefile update
> +
> +Makefile cleanup: remove -Werror flag in CFLAGS
> +
> +Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index d0c0ce4..003928b 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,4 +1,4 @@
> +-CFLAGS += -std=gnu99 -O2 -g -Wall -Werror
> ++CFLAGS += -std=gnu99 -O2 -g -Wall
>   This patch doesn't apply, the CFLAGS line looks completely different. Have you
> tested your patch before submitting?

yes I have tested my patch and it will apply fine.


> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160211/997ead13/attachment.html>
