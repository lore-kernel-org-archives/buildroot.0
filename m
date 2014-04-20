From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 23:17:25 +0200
Subject: [Buildroot] [PATCH 1/1] xerces: add host
In-Reply-To: <1385063284-31586-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1385063284-31586-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <20140420231725.0c01e16a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Thu, 21 Nov 2013 13:48:04 -0600, Matt Weber wrote:
> 
> Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
> ---
>  package/xerces/xerces.mk |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
> index 7bd7070..2e4c512 100644
> --- a/package/xerces/xerces.mk
> +++ b/package/xerces/xerces.mk
> @@ -25,3 +25,4 @@ XERCES_CONF_OPT += --disable-network
>  endif
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

Since there is no package in mainline Buildroot that needs host-xerces
and that you've never submitted the other packages you mentioned back
in November, I've marked this patch as Rejected in Patchwork for now.
Do not hesitate to resend it later, together with other patches making
use of it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
