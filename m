From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 21:59:36 +0100
Subject: [Buildroot] [PATCH] zmqpp: update license
In-Reply-To: <1489501777-6548-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1489501777-6548-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20170314215936.4d3c12f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 19:59:37 +0530, Rahul Bedarkar wrote:
> Since version 4.1.2, zmqpp is provided under MPLv2.
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/zmqpp/zmqpp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
> index 18da709..3e35fd7 100644
> --- a/package/zmqpp/zmqpp.mk
> +++ b/package/zmqpp/zmqpp.mk
> @@ -8,7 +8,7 @@ ZMQPP_VERSION = 4.1.2
>  ZMQPP_SITE = $(call github,zeromq,zmqpp,$(ZMQPP_VERSION))
>  ZMQPP_INSTALL_STAGING = YES
>  ZMQPP_DEPENDENCIES = zeromq
> -ZMQPP_LICENSE = MIT
> +ZMQPP_LICENSE = MPLv2.0

Wow, thanks, well noticed indeed! Patch applied to master.

And the worst thing is that previous versions were not even under the
MIT license: they were under LGPLv3 + static linking exception.

Peter: we really want this one in the LTS branch, since 4.1.2 was
already used in the LTS branch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
