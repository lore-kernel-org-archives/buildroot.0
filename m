From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Sep 2020 09:33:35 +0200
Subject: [Buildroot] [PATCH v2 0/2] Buildroot support for Chromebook Elm
In-Reply-To: <20200923235214.437005-1-bilalwasim676@gmail.com>
References: <20200923235214.437005-1-bilalwasim676@gmail.com>
Message-ID: <20200924093335.44fb8da1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bilal,

On Thu, 24 Sep 2020 04:52:12 +0500
Bilal Wasim <bilalwasim676@gmail.com> wrote:

> Bilal Wasim (2):
>   board/chromebook: Add support of Chromebook Elm
>   DEVELOPERS: add myself as contact for chromebook elm

Thanks for your new quick iteration. I squashed both patches together,
and changed the commit title to configs/chromebook_elm: new defconfig.

I also changed to use BR2_GLOBAL_PATCH_DIR instead of
BR2_LINUX_KERNEL_PATCH, as we prefer using BR2_GLOBAL_PATCH_DIR.

Applied with those changes! Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
