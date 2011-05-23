From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Mon, 23 May 2011 08:29:59 +0200
Subject: [Buildroot] buildroot and the at91sam9261ek.
In-Reply-To: <4DD956B6.4010907@opensoftware-br.com>
References: <4DD956B6.4010907@opensoftware-br.com>
Message-ID: <4DD9FEE7.7080306@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 5/22/2011 8:32 PM, Paulo Silva(OpenSoftware) wrote:
> Hi all,
>
> I am new to buildroot, but the tool is so easy that I had compiled all 
> things and I can:
> * run the bootstrap that calls u-boot
> * run u-boot that calls kernel.
> * run kernel that stop because it does not have a rootfile system.
>
> I configured the buildroot to generate initramfs, but instead to 
> attach it to a kernel end it put the the initramfs file in /usr 
> directory.
>
> So I ask you, how to put the initramfs into kernel file end?
Do you set the initramfs source file into the kernel configuration 
(General Setup section) ? I think it's not done into the defconfig of 
this board.

Regards,

Ludovic
