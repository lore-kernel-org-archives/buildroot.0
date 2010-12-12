From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 12:34:47 +0100
Subject: [Buildroot] [PATCH 08/15] toolchain: rework thread options
In-Reply-To: <874oaklyih.fsf@macbook.be.48ers.dk>
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<99d8d624018cee0c619bc147ed4ab8eaeaf50828.1291541115.git.thomas.petazzoni@free-electrons.com>
	<874oaklyih.fsf@macbook.be.48ers.dk>
Message-ID: <20101212123447.2be7c84c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Dec 2010 23:45:26 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> +choice
>  Thomas> +	prompt "Thread library implementation"
>  Thomas> +	default BR2_PTHREADS_OLD
>  Thomas> +	help
>  Thomas> +	  If you are building your own toolchain then
>  Thomas> select the type
> 
> This is now only shown if we're building a toolchain, so this part of
> the help text could go.

Fixed.

>  Thomas> +config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
>  Thomas> +	bool "Toolchain has threads support ?"
> 
> No space before '?'

Ditto.

>  Thomas> +	select BR2_TOOLCHAIN_HAS_THREADS
>  Thomas> +	help
>  Thomas> +	  Enable this option if you want your external
>  Thomas> toolchain has
>  Thomas> +	  support for C++. If you don't know, leave the
>  Thomas> default value,
>  Thomas> +	  Buildroot will tell you if it's correct or not.
> 
> Cut'n'paste? ;) It shouldn't be about C++ and reworded.

Indeed, bad cut and paste. Fixed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
