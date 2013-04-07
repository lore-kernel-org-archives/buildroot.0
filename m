From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Apr 2013 22:47:47 +0200
Subject: [Buildroot] [PATCH v2 3/7] arch: toolchain: Introduce binary
 formats BINFMT_*.
In-Reply-To: <1364550643-11793-3-git-send-email-sonic.adi@gmail.com>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
 <1364550643-11793-3-git-send-email-sonic.adi@gmail.com>
Message-ID: <20130407224747.6e0892cc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Fri, 29 Mar 2013 17:50:39 +0800, Sonic Zhang wrote:

> +choice
> +	prompt "Target Binary Format"
> +	default BR2_BINFMT_ELF
> +config BR2_BINFMT_ELF
> +	bool "ELF"
> +config BR2_BINFMT_FDPIC
> +	bool "FDPIC"
> +config BR2_BINFMT_FLAT
> +	bool "FLAT"
> +	select BR2_PREFER_STATIC_LIB
> +endchoice

Maybe some help text would also be nice for each choice.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
