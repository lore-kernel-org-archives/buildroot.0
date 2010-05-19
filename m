From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 May 2010 13:33:18 +0200
Subject: [Buildroot] [PATCH 1/8] Add a BR2_NEEDS_GETTEXT option
In-Reply-To: <87eihb0y1v.fsf@macbook.be.48ers.dk>
References: <cover.1273836748.git.thomas.petazzoni@free-electrons.com>
	<cover.1273836748.git.thomas.petazzoni@free-electrons.com>
	<332ed1e3ae5fa11372d522c9c0d03cc01475866a.1273836748.git.thomas.petazzoni@free-electrons.com>
	<87eihb0y1v.fsf@macbook.be.48ers.dk>
Message-ID: <20100519133318.26f954bb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 May 2010 09:47:40 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> +config BR2_NEEDS_GETTEXT
>  Thomas> +	bool
>  Thomas> +	default y if BR2_TOOLCHAIN_BUILDROOT
>  Thomas> +	default y if BR2_TOOLCHAIN_EXTERNAL_UCLIBC
>  Thomas> +	default n if BR2_TOOLCHAIN_EXTERNAL_GLIBC
> 
> You don't really need the 'default n' (as that's default), but ok.

True. But in this particular case, I think it makes it clear in which
case it is "y" and in which case it is "n".

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
