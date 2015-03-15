From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 23:06:51 +0100
Subject: [Buildroot] [PATCH 41/51] zmqpp: bump version
In-Reply-To: <1414349157-22749-41-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414349157-22749-41-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150315230651.3ec64964@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 26 Oct 2014 19:45:47 +0100, Maxime Hadjinlian wrote:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/zmqpp/zmqpp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
> index fbb0260..4323401 100644
> --- a/package/zmqpp/zmqpp.mk
> +++ b/package/zmqpp/zmqpp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ZMQPP_VERSION = 36413487f05b165dfc82ad307a5a1c36a795e607
> +ZMQPP_VERSION = 4.1.1
>  ZMQPP_SITE = $(call github,benjamg,zmqpp,$(ZMQPP_VERSION))
>  ZMQPP_INSTALL_STAGING = YES
>  ZMQPP_DEPENDENCIES = zeromq

Romain Naour said:

==
There is a patch from Maxime to bump to 4.1.1 but this tag appear only on the
unofficial git repository.
http://patchwork.ozlabs.org/patch/403314/

For now, master branch is at 3.2.0 and the develop branch is at 4.1.1
==

So I've marked your zmqpp bump patch as Rejected.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
