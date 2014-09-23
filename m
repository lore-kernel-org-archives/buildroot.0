From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 21:56:10 +0200
Subject: [Buildroot] [PATCH] gnuplot: bump to version 4.6.6
In-Reply-To: <1411483294-9742-1-git-send-email-gustavo@zacarias.com.ar>
References: <1411483294-9742-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140923215610.0e46e6b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 23 Sep 2014 11:41:34 -0300, Gustavo Zacarias wrote:
> Also add hash file.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gnuplot/gnuplot.hash | 3 +++
>  package/gnuplot/gnuplot.mk   | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>  create mode 100644 package/gnuplot/gnuplot.hash

Applied, thanks. I've downloaded the tarballs on my side as well, and
had the same hashes.

Could you have a look at http://patchwork.ozlabs.org/patch/375696/, and
give some Tested-by/Acked-by if applicable? The patch is gnuplot
related.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
