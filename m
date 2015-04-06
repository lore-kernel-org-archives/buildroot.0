From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 12:22:13 +0200
Subject: [Buildroot] [PATCH v2 1/3] Remove --{enable,
 disable}-debug configure flags.
In-Reply-To: <1426173147-27755-1-git-send-email-johan.oudinet@gmail.com>
References: <1426173147-27755-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150406122213.6443f117@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Thu, 12 Mar 2015 16:12:25 +0100, Johan Oudinet wrote:
> Adding this flag when BR2_ENABLE_DEBUG is activated make several
> packages to produce binaries that do not work as expected (e.g., dhcp,
> lame, nano). Moreover, the help message of BR2_ENABLE_DEBUG does not
> say it is adding this flag. It is supposed to build packages with
> debugging symbols enabled. So, let it do that only.
> 
> * package/Makefile.in: Do not add --{enable,disable}-debug flags.
> * package/pkg-autotools.mk: Remove ENABLE_DEBUG as it is not set
>   anymore.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

Unless someone opposes to this change, I will apply it soon. So if you
don't agree, speak up. If you agree, give your Acked-by/Reviewed-by.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
