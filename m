From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 23:23:56 +0200
Subject: [Buildroot] [PATCH v4 1/2] cracklib: New package
In-Reply-To: <20170505123527.29434-1-stefan.sorensen@spectralink.com>
References: <20170505123527.29434-1-stefan.sorensen@spectralink.com>
Message-ID: <20170511232356.4e12aab0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 May 2017 14:35:26 +0200, Stefan S?rensen wrote:

> +ifeq ($(BR2_PACKAGE_CRACKLIB),y)
> +LINUX_PAM_CONF_OPTS += --enable-cracklib
> +LINUX_PAM_DEPENDENCIES += cracklib
> +else
> +LINUX_PAM_CONF_OPTS += --disable-cracklib
> +endif

This should have been in a separate patch, so I've split that into a
separate commit.

Other than that: applied to the next branch, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
