From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 16:54:24 +0100
Subject: [Buildroot] [PATCH 2/3] package/mesa3d: bump version to 10.5.1
In-Reply-To: <1426428048-25586-2-git-send-email-bernd.kuhls@t-online.de>
References: <1426428048-25586-1-git-send-email-bernd.kuhls@t-online.de>
 <1426428048-25586-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150315165424.1b589bf9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 15 Mar 2015 15:00:47 +0100, Bernd Kuhls wrote:

>  MESA3D_DEPENDENCIES = \
>  	expat \
> -	host-bison \
> -	host-flex \
>  	host-gettext \
> -	host-python \
> -	host-xutil_makedepend \
> +	host-python-mako \
>  	libdrm

Can you say a few words about these dependency changes?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
