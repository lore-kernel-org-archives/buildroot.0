From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Nov 2015 10:54:39 -0300
Subject: [Buildroot] [PATCH 1/1] configs/qemu: add DTB support for ARM
 Versatile PB
In-Reply-To: <20151125144810.04e7ed7e@free-electrons.com>
References: <1448457599-29371-1-git-send-email-guillaume.delbergue@greensocs.com>
 <20151125144810.04e7ed7e@free-electrons.com>
Message-ID: <5655BD9F.10001@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/11/15 10:48, Thomas Petazzoni wrote:

>> Add CONFIG_MACH_VERSATILE_DT to support Versatile platform from device tree
>>
>> Signed-off-by: Guillaume Delbergue <guillaume.delbergue@greensocs.com>
>
> Then maybe the board/qemu/arm-versatile/readme.txt file should be
> updated to make use of the DTB ?
>
> Gustavo ?
>
> Thanks,
>
> Thomas

Hi.
Yes, definitely, since we don't default to any form of appended DTB for 
that defconfig the current instructions will probably result in a 
non-bootable scenario.
Care to adjust this and send a new patch?
You can look at the vexpress readme.txt 
(board/qemu/arm-vexpress/readme.txt) on how to adjust/use it, but in 
theory you already do that unless you changed the kernel output to 
appended zImage.
Regards.
