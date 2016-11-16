From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Nov 2016 15:22:48 +0100
Subject: [Buildroot] [PATCH] package/e2fsprogs: backport build fix for
 rhel5 due to missing magic
In-Reply-To: <20161116140015.iscxr2td723pgyly@sapphire.tkos.co.il>
References: <1478677142-11627-1-git-send-email-jcmvbkbc@gmail.com>
 <20161116131231.20069c38@free-electrons.com>
 <20161116140015.iscxr2td723pgyly@sapphire.tkos.co.il>
Message-ID: <20161116152248.2c639f88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Nov 2016 16:00:15 +0200, Baruch Siach wrote:

> > E2FSPROGS_CONF_ENV += \
> > 	ac_cv_header_magic_h=no \
> >   	ac_cv_lib_magic_magic_file=no
> > 
> > instead of this patch?  
> 
> Do you mean HOST_E2FSPROGS_CONF_ENV?

Yes, indeed, it's for the host variant of the package.

Thanks for correcting me on this,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
