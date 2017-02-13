From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 15:58:29 +0100
Subject: [Buildroot] [PATCH 1/1] Install raptor package in staging
In-Reply-To: <1182785180.5405440.1486972873694@mail.yahoo.com>
References: <1182785180.5405440.1486972873694.ref@mail.yahoo.com>
 <1182785180.5405440.1486972873694@mail.yahoo.com>
Message-ID: <20170213155829.7663c0e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution! This looks mostly good, but I have a few
comments below.

The commit title should be:

	raptor: install package to staging

indeed, for consistency reasons, we want all commit titles to follow
the format:

	<package>: <short description>

On Mon, 13 Feb 2017 08:01:13 +0000 (UTC), Erwan Gautron wrote:
> Signed-off-by: Erwan Gautron <erwan.gautron@yahoo.fr>

Could you expand the commit log to explain *why* we want to install
this package to staging?

> ?package/raptor/raptor.mk | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
> index aea14e3..a2c2b23 100644
> --- a/package/raptor/raptor.mk
> +++ b/package/raptor/raptor.mk
> @@ -13,7 +13,7 @@ RAPTOR_LICENSE_FILES = LICENSE.txt
> ?
> ?# Flag is added to make sure the patch is applied for the configure.ac of raptor.
> ?RAPTOR_AUTORECONF = YES
> -
> +RAPTOR_INSTALL_STAGING=YES

Missing spaces before and after the equal sign.

I could have fixed this and the commit title myself, but I can't fix
the reason why this patch is useful. So can you fix all three issues
and submit an updated version of your patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
