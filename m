From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 20:51:27 +0100
Subject: [Buildroot] [PATCH] package/gcc: fix xtensa uclinux code
 generation
In-Reply-To: <CAMo8Bf+=OZWK2m8=i9e99UGBBDY5h9k+SaNB54h_ag9MiaLUOg@mail.gmail.com>
References: <20181107212050.32439-1-jcmvbkbc@gmail.com>
 <20181108113533.1f72e417@windsurf>
 <CAMo8Bf+=OZWK2m8=i9e99UGBBDY5h9k+SaNB54h_ag9MiaLUOg@mail.gmail.com>
Message-ID: <20181108205127.76b81a8a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Nov 2018 10:28:01 -0800, Max Filippov wrote:

> On Thu, Nov 8, 2018 at 2:35 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > Do we actually support xtensa-uclinux (i.e noMMU Xtensa with BFLT) in
> > the context of Buildroot ?  
> 
> We do. There's even configs/qemu_xtensa_lx60_nommu_defconfig
> with an example config that builds working image.

Ah, forgot about this! Nice. Perhaps we should be testing this in the
autobuilders ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
