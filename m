From: cugyly <cugyly@163.com>
Date: Tue, 16 Oct 2012 21:31:59 +0800
Subject: [Buildroot] =?utf-8?b?5Zue5aSNOiAgUmU6ICBbQnVpbGRSb290XVtRdWVz?=
	=?utf-8?q?tion=5D_How_to_compile_toolChain_standalone=3F?=
In-Reply-To: <CAHXCMMJP5HAiF_aMxsu=rHxwAwZVDys61PH4HQggLx58CnpZ4A@mail.gmail.com>
References: <40022197.569d.13a64eef8ec.Coremail.cugyly@163.com><CAHXCMMJP5HAiF_aMxsu=rHxwAwZVDys61PH4HQggLx58CnpZ4A@mail.gmail.com>
Message-ID: <366ca9a9.8c03.13a69c61615.Coremail.cugyly@163.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Martin
But I found "make clean cross" command also remove all host compiled package?
Any simple way to just compile gcc when i change the top configuration(for my notebook speed is lower)?

2012-10-16



cugyly



????Samuel Martin
?????2012-10-15 23:28
???Re: [Buildroot] [BuildRoot][Question] How to compile toolChain standalone?
????"cugyly"<cugyly@163.com>
???"buildroot"<buildroot@busybox.net>

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
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121016/be357f9b/attachment.html>
