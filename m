From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Sep 2014 21:43:38 +0200
Subject: [Buildroot] [PATCH] util-linux: bump to version 2.25.1
In-Reply-To: <1410189652-4146-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410189652-4146-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140908214338.070c3a2a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  8 Sep 2014 12:20:52 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../util-linux-001-sscanf-no-ms-as.patch           | 75 ++++++++++++++++------
>  .../util-linux-004-support-static-lib-build.patch  | 57 ----------------
>  package/util-linux/util-linux.mk                   |  7 +-
>  3 files changed, 61 insertions(+), 78 deletions(-)
>  delete mode 100644 package/util-linux/util-linux-004-support-static-lib-build.patch

Indeed util-linux-004-support-static-lib-build.patch was merged
upstream, so:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
