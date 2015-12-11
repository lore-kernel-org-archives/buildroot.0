From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Dec 2015 21:29:32 +0100
Subject: [Buildroot] [PATCH] pango: drop PANGO_CONF_ENV variables
In-Reply-To: <1449778645-9112-1-git-send-email-gustavo@zacarias.com.ar>
References: <1449778645-9112-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151211212932.66dc350f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 10 Dec 2015 17:17:25 -0300, Gustavo Zacarias wrote:
> These are completely historic from the initial commit (d106a63d) and
> completely unused.
> 
> Two separate builds with/without give nothing relevant with:
> 
> $ diff -u pango.cv/config.log pango-1.38.1/config.log|grep ^+
> 
> Same applies to removals with:
> 
> $ diff -u pango.cv/config.log pango-1.38.1/config.log|grep ^-
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/pango/pango.mk | 53 --------------------------------------------------
>  1 file changed, 53 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
