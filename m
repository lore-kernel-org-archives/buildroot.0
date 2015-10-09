From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Fri, 9 Oct 2015 16:53:14 +0100
Subject: [Buildroot] [PATCH v2] board: add support for ARM Juno r1
 Development Board
In-Reply-To: <20151009174818.5a2797ce@free-electrons.com>
References: <5d1c2273948fbee558ec58ff605bb16410733217.1444403756.git.jpinto@synopsys.com>
 <20151009174818.5a2797ce@free-electrons.com>
Message-ID: <5617E2EA.2040601@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Firstly let me congratulate you on your presentation in the Auditorium.

On 10/9/2015 4:48 PM, Thomas Petazzoni wrote:
> Dear Joao Pinto,
> 
> On Fri,  9 Oct 2015 16:29:05 +0100, Joao Pinto wrote:
>> The Juno r1 ARM Development Platform (ADP) is a software development
>> platform for ARMv8-A, it includes the Juno r1 Versatile Express board 
>> and an ARMv8-A reference software port available through Linaro.
>>
>> Remark: The kernel' arm64 defconfig lacks a considerable amount of 
>> configuration items regarding the Juno r1 board, and that is the reason
>> of this custom kernel configuration file.
> 
> Can you add a readme.txt file in board/arm/junor1/ that explains how to
> use the result? You're building just a tarball for the root filesystem,
> what are the instructions to actually use it on the board?

I will add a readme.txt file. The Juno r1 accepts typically an ext formatted
pen-drive from where it mounts the root filesystem. The simplest procedure its
to untar the rootfs.tar to the pen-drive and give it a go.

> 
> Thanks,
> 
> Thomas
> 

Thanks,
Joao
