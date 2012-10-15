From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 15 Oct 2012 17:27:53 +0200
Subject: [Buildroot] [BuildRoot][Question] How to compile toolChain
	standalone?
In-Reply-To: <40022197.569d.13a64eef8ec.Coremail.cugyly@163.com>
References: <40022197.569d.13a64eef8ec.Coremail.cugyly@163.com>
Message-ID: <CAHXCMMJP5HAiF_aMxsu=rHxwAwZVDys61PH4HQggLx58CnpZ4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2012/10/15 cugyly <cugyly@163.com>:
> Hi,
> I am new to buildroot.
>
> I have to change the configuration of toolchain(kernel, uclibc) before
> generate the correct configured toolchain. My question how to generate
> toolchain seperately without compile uboot, kernel and rootfs?
First, save the uclibc config somewhere out of the output directory
and set this new uclibc.config file path to as the uclibc config in
buildroot menuconfig.
Then run: 'make clean cross'


Regards,


-- 
Sam
