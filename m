From: Gary Partis <gary@partis.co.uk>
Date: Tue, 17 Feb 2015 14:56:26 -0000
Subject: [Buildroot] grub2 and 2015.02-rc2
In-Reply-To: <20150217144248.3996c923@free-electrons.com>
References: <01df01d04ab1$6283b550$278b1ff0$@partis.co.uk>
 <20150217144248.3996c923@free-electrons.com>
Message-ID: <02b901d04ac1$e7be0d00$b73a2700$@partis.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

Ah - I was hoping that grub2 didn't require root access (loop back device
etc), to simply install boot sector code and place some other code elsewhere
within image file system.... :-(

Cheers

Gary


-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: 17 February 2015 13:43
To: Gary Partis
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] grub2 and 2015.02-rc2

Dear Gary Partis,

On Tue, 17 Feb 2015 12:58:10 -0000, Gary Partis wrote:

> Is there a simple workaround for this, or am I missing something 
> really obvious?

Did you follow the grub2 installation procedure described at:

  http://git.buildroot.net/buildroot/tree/boot/grub2/Config.in#n14

This text is visible in the help text of the grub2 option in
menuconfig/xconfig.

Best regards,

Thomas Petazzoni
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com
