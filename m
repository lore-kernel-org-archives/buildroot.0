From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Mar 2015 09:59:05 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/mesa3d: bump version to
 10.5.1
In-Reply-To: <1426435802-14030-2-git-send-email-bernd.kuhls@t-online.de>
References: <1426435802-14030-1-git-send-email-bernd.kuhls@t-online.de>
 <1426435802-14030-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150321095905.0e24d32c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 15 Mar 2015 17:10:01 +0100, Bernd Kuhls wrote:

>  MESA3D_DEPENDENCIES = \
>  	expat \
> -	host-bison \
> -	host-flex \
>  	host-gettext \
> -	host-python \
> -	host-xutil_makedepend \
> +	host-python-mako \

This is apparently not working well in some cases, see
http://autobuild.buildroot.net/results/1ce/1ce2509c8abb7483397c7d0f21c299095e94a254/.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
