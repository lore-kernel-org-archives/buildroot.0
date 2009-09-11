From: Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com>
Date: Fri, 11 Sep 2009 09:27:18 +0200
Subject: [Buildroot] External Toolchain in latest stable buildroot
In-Reply-To: <20090911091415.19422fbb@surf>
References: <330EC2471BF24E48B513AF1A6975EB69AD87F9@MAIL-UA.ccs.local>
	<20090911091415.19422fbb@surf>
Message-ID: <330EC2471BF24E48B513AF1A6975EB69AD8816@MAIL-UA.ccs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks for the fast reply.

> -----Original Message-----
> What does the following command returns ?
> 
>  LANG=C $(TARGET_CC) -v
> 
> If you see a --with-sysroot thing in the result, could you look in
this
> directory, and then in /lib/ to see if there is any ld-linux.* file ?
This was the case. I was installed the toolchain in the wrong directory
at first. I'll see what happens now that I have the toolchain in the
right place.

Teemu Keskinarkaus
