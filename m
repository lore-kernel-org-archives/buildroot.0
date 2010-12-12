From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 12:04:35 +0100
Subject: [Buildroot] [PATCH 03/15] toolchain: add support for external
 toolchain profiles and download
In-Reply-To: <87k4jglzdt.fsf@macbook.be.48ers.dk>
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<3a0463ff0daf67faf5c2b278726c84d70084029b.1291541115.git.thomas.petazzoni@free-electrons.com>
	<87k4jglzdt.fsf@macbook.be.48ers.dk>
Message-ID: <20101212120435.17d4e07d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Dec 2010 23:26:38 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas>  config BR2_TOOLCHAIN_EXTERNAL_STRIP
>  Thomas>  	bool
>  Thomas>  	default y
>  Thomas> +	depends on BR2_TOOLCHAIN_EXTERNAL
> 
> This is all in an if BR2_TOOLCHAIN_EXTERNAL conditional. Did you mean
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM instead?

This option is removed by the next patch anyway, but I fixed this
patch (just removed this added line).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
