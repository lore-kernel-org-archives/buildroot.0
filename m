From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jul 2014 20:22:42 +0200
Subject: [Buildroot] Filesystem being corrupted
In-Reply-To: <53B567C2.2070502@the-playground.dk>
References: <53B5331B.9030703@the-playground.dk>
 <53B54CEC.5070803@zacarias.com.ar>
 <53B55511.8030706@the-playground.dk>
 <53B567C2.2070502@the-playground.dk>
Message-ID: <20140703202242.223b38ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Robert Larsen,

On Thu, 03 Jul 2014 16:25:06 +0200, Robert Larsen wrote:
> On 07/03/2014 03:05 PM, Robert Larsen wrote:
> > On 07/03/2014 02:30 PM, Gustavo Zacarias wrote:
> >> Any reason in particular to stick with vexpress?
> > Not really, that was what I was used to. I'll try versatile.
> >
> Hmm, building with versatile defconfig hangs qemu. I tried both '-M
> versatilepb' and '-M versatileab'
> Both hang after this message:
> 
> Uncompressing Linux... done, booting the kernel.
> 

Most likely incorrect kernel configuration.

You should start with the qemu_arm_versatile_defconfig available in
Buildroot, which uses a correct kernel configuration.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
