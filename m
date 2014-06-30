From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jun 2014 11:49:33 +0200
Subject: [Buildroot] Is grub-bios-setup the way to go to make a bootable
 CF?
In-Reply-To: <CAEzGmjCgQmFhN9fuc_2z-Aj37k42Oyg4YmshkYbjy+pLAkFmEw@mail.gmail.com>
References: <CAEzGmjD9xC59mSjgPAr2GeB15cUwaExp7KfjbRyRMFVHD=92+g@mail.gmail.com>
 <20140627203224.1149e36a@free-electrons.com>
 <CAEzGmjCgQmFhN9fuc_2z-Aj37k42Oyg4YmshkYbjy+pLAkFmEw@mail.gmail.com>
Message-ID: <20140630114933.33262a25@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lennart Ramberg,

On Mon, 30 Jun 2014 10:23:06 +0200, Lennart Ramberg wrote:

> Thank you Thomas,
> 
> It helped to use sudo :-)
> to get rid of that annoying
> "cannot open `/boot/grub/device.map': No such file or directory."
> 
> Now, putting the thus created CF in the target system brings me (only) to:
> grub>
> 
> Should I expect to automatically have come further?

Yes, it should show the menu thanks to the configuration file. What
exact steps have you followed to put the root filesystem and Grub on
your Compact Flash?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
