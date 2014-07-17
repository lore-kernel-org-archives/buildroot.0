From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 22:57:53 +0200
Subject: [Buildroot] [PATCH] linux: fix fallout from
 c78d57637cd57a383e44713eb27e654b3071340e
In-Reply-To: <1405626908-11988-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405626908-11988-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140717225753.4b76b58f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 17 Jul 2014 16:55:08 -0300, Gustavo Zacarias wrote:
> The new variable LINUX_TARGET_NAME is unconditionally used but it may be
> unset leading to a default kernel build (which might not be uImage or
> other requested format).
> See http://lists.busybox.net/pipermail/buildroot/2014-July/102069.html
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  linux/linux.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
