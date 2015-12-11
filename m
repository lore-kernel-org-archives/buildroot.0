From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Dec 2015 21:29:29 +0100
Subject: [Buildroot] [PATCH] cairo: drop CAIRO_CONF_ENV variables
In-Reply-To: <1449778632-9069-1-git-send-email-gustavo@zacarias.com.ar>
References: <1449778632-9069-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151211212929.3af8f401@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 10 Dec 2015 17:17:12 -0300, Gustavo Zacarias wrote:
> These are completely historic from the initial commit (3a0a8791) and
> completely unused.
> 
> Two separate builds with/without give nothing relevant with:
> 
> $ diff -u cairo.cv/config.log cairo-1.14.4/config.log|grep ^+
> 
> Same applies to removals with:
> 
> $ diff -u cairo.cv/config.log cairo-1.14.4/config.log|grep ^-
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/cairo/cairo.mk | 52 --------------------------------------------------
>  1 file changed, 52 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
