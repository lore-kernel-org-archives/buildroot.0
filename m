From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 15:36:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: Show toolchain
 comment only on mmu archs
In-Reply-To: <1428739246-3867-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428739246-3867-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150411153600.7d3a7fc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 11 Apr 2015 10:00:46 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/e2fsprogs/Config.in |    1 +
>  1 file changed, 1 insertion(+)

I've reordered the dependency to put BR2_USE_MMU first as
suggested by Yann, and applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
