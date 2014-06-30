From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jul 2014 00:41:06 +0200
Subject: [Buildroot] Is grub-bios-setup the way to go to make a bootable
 CF?
In-Reply-To: <CAEzGmjAfUbvudT2nwDJOpbWUy3ZHw=UaWEf-WRupSQv6XsbiGQ@mail.gmail.com>
References: <CAEzGmjD9xC59mSjgPAr2GeB15cUwaExp7KfjbRyRMFVHD=92+g@mail.gmail.com>
 <20140627203224.1149e36a@free-electrons.com>
 <CAEzGmjCgQmFhN9fuc_2z-Aj37k42Oyg4YmshkYbjy+pLAkFmEw@mail.gmail.com>
 <20140630114933.33262a25@free-electrons.com>
 <CAEzGmjAfUbvudT2nwDJOpbWUy3ZHw=UaWEf-WRupSQv6XsbiGQ@mail.gmail.com>
Message-ID: <20140701004106.08c975ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lennart Ramberg,

On Mon, 30 Jun 2014 21:53:32 +0200, Lennart Ramberg wrote:

> Below I detail out what I did.
> I also attach my .config (dotconfig) that resulted from my actions
> described below.
> 
> I hope the below could be of use.

[... snip lots of details ...]

> Ready to test. Rebooted my PC with CF still in place gives just:
> GNU GRUB version 2.00
> blablabla
> grub>
> 
> --- end ---

Thanks for this very detailed report. I'm able to reproduce the issue
now under Qemu. It's weird, I'm 100% sure I tested this when I
contributed the grub2 support. I'll have to investigate to find where
the problem lies.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
