From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jan 2013 09:57:02 +0100
Subject: [Buildroot] [RFC] How to handle targets that need more than one
 file system to boot?
In-Reply-To: <50E54714.8060602@mind.be>
References: <201212240100.17473.yann.morin.1998@free.fr>
 <201301030056.01956.yann.morin.1998@free.fr>
 <CAJJ6jxudS63P58imQ6nPn=_AA9JoBMZp3i=Dq2As1c9EiCDZxg@mail.gmail.com>
 <201301030940.07495.yann.morin.1998@free.fr>
 <50E54714.8060602@mind.be>
Message-ID: <20130103095702.68dd064c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 03 Jan 2013 09:53:40 +0100, Arnout Vandecappelle wrote:

>   AFAIK there is no equivalent of genext2fs for FAT, so it would be 
> rather difficult to make a boot-vfat.img in buildroot (use sudo?
> fuse? pmount?).

You have the mtools, see http://www.gnu.org/software/mtools/.

Also, see the genimage tool from Pengutronix people:
http://www.pengutronix.de/software/genimage/download/.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
