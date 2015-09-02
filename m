From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Sep 2015 15:13:42 +0100
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <20150902161234.042e03f8@free-electrons.com>
References: <1441148113-4894-1-git-send-email-yann.morin.1998@free.fr>	<20150902091051.7ee82cf3@free-electrons.com>	<CANPyyuP-7XUHqJET+UOKEtGS8_N4R0nAFY1tfffrUK5oko5DnA@mail.gmail.com>	<20150902160446.7fbf9ef6@free-electrons.com>	<55E702BD.5090608@imgtec.com>
 <20150902161234.042e03f8@free-electrons.com>
Message-ID: <55E70416.30309@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

On 09/02/2015 03:12 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Wed, 2 Sep 2015 15:07:57 +0100, Vicente Olivert Riera wrote:
> 
>> and what about also selecting BR2_ROOTFS_USR_SYMLINKS in systemd's
>> Config.in?
> 
> From Yann's patch:
> 
> @@ -88,6 +88,7 @@ config BR2_INIT_SYSTEMD
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
> +	select BR2_ROOTFS_USR_SYMLINKS
>  	select BR2_PACKAGE_SYSTEMD
> 
> Isn't that enough?

Shame on me. I missed that part of the patch, sorry.

Regards,

Vincent.

> Thomas
>
