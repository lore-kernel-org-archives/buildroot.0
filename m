From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 13 Dec 2007 20:55:32 +0100
Subject: [Buildroot] how to use custom kernel with its .config in
	buildroottoolchain ??
References: <440e0a9b0712130631u6c7d4386jaf07ec7e8e1c4ec5@mail.gmail.com>
Message-ID: <028201c83dd2$66cc7140$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> Hi All
> 
> I have customized Linux 2.6.21 kernel for my board specification and
> produced a .config file
> 
> In buildroot how/where to point the above my kernel with my .config file ??
> 
> Instead of downloading the kernel, the buildroot should use my kernel and
> .config
> 
> Please help me where to provide this and how to modify this in toolchain ??
> 

Use the "Advanced Linux" configuration.


Best Regards
Ulf Samuelsson
