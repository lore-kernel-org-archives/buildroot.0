From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Oct 2013 16:11:34 +0200
Subject: [Buildroot] [PATCHv3 13/20] toolchain-external: improve help
 text of some options
In-Reply-To: <877gdm35k4.fsf@dell.be.48ers.dk>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-14-git-send-email-thomas.petazzoni@free-electrons.com>
 <877gdm35k4.fsf@dell.be.48ers.dk>
Message-ID: <20131009161134.7a70467c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 09 Oct 2013 16:03:07 +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Thomas> ---
>  Thomas>  toolchain/toolchain-external/Config.in | 15 +++++++++++----
>  Thomas>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> [snip]
> 
>  Thomas> +	  Note: eglibc is a variant of glibc that (among other things)
>  Thomas> +	  can be configured to exclude some of its features. Using a
>  Thomas> +	  toolchain with eglibc configured to exclude key features may
>  Thomas> +	  cause build failures to some packages.
>  
>  Thomas>  config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL
>  Thomas>  	bool "musl"
> 
> No musl help text?

Damn, will send a follow up patch.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
