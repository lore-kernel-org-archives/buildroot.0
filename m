From: Tobias Andresen <tobiasarp@gmx.de>
Date: Wed, 2 Mar 2016 07:11:05 +0100
Subject: [Buildroot] Add different glibc
In-Reply-To: <20160228222254.62d8af48@free-electrons.com>
References: <56D357C5.8040000@gmx.de>
 <20160228222254.62d8af48@free-electrons.com>
Message-ID: <56D683F9.3060507@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

i just want to replace the glibc on an old embedded system with glibc 
2.23 without rebuilding it completely.
Just wanted to find a simple way to do this for someone who cannot 
crosscompile glibc without
a tool like buildroot.

Regards
Tobias
Am 28.02.2016 um 22:22 schrieb Thomas Petazzoni:
> Hello Tobias,
>
> On Sun, 28 Feb 2016 21:25:41 +0100, Tobias Andresen wrote:
>
>> can someone give me a hint how to add a different glibc as a package
>> which will be copied into the rootfs instead of the
>> glibc which is part of the toolchain?
> Why would you want to do this?
>
> In any case, you can customize whatever is in your root filesystem by
> creating a post-build script.
>
> Best regards,
>
> Thomas
