From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:50:05 +0100
Subject: [Buildroot] [PATCH 08/32] package/systemd: remove networkd
 depends from timesyncd
In-Reply-To: <1456437341-19025-9-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-9-git-send-email-gabe@hashrabbit.co>
Message-ID: <20160229225005.1de3475c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gabe Evans,

On Thu, 25 Feb 2016 21:55:17 +0000, Gabe Evans wrote:
> systemd-timesyncd can function without systemd-networkd.
> 
> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
> ---
>  package/systemd/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
