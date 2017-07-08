From: daggs <daggs@gmx.com>
Date: Sat, 8 Jul 2017 08:16:57 +0200
Subject: [Buildroot] [for-next 3/3] package/gcc: remove gcc 4.9
In-Reply-To: <20170525183457.12169-3-romain.naour@gmail.com>
References: <20170525183457.12169-1-romain.naour@gmail.com>
 <20170525183457.12169-3-romain.naour@gmail.com>
Message-ID: <trinity-b94745ea-daa8-45b4-9311-89dd03833ec6-1499494617036@3capp-mailcom-bs11>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Romain,

> Sent: Thursday, May 25, 2017 at 9:34 PM
> From: "Romain Naour" <romain.naour@gmail.com>
> To: buildroot at buildroot.org
> Cc: "Romain Naour" <romain.naour@gmail.com>, "Dagg Stompler" <daggs@gmx.com>
> Subject: [Buildroot] [for-next 3/3] package/gcc: remove gcc 4.9
>
> We're already using 6.x as default, and have 5.x on the lower side
> together with 7.x (7.1) on the higher side.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Dagg Stompler <daggs@gmx.com>
> ---
> configs/odroidc2_defconfig is still using gcc 4.9 due to bugs in
> uboot. But since then uboot version was changed.
> Dagg can you test again with gcc 5 ?

my apologies for not addressing this earlier, I had some pressure at work and urgent family issues to attend.
I won't my special filter didn't caught these mails, will recheck it.
for now, odroid c2 need that compiler because it uses the vendor's forked uboot.
as of uboot 2017.05, there is support for this board in the official tree. afaik, bumping uboot to that version remove the gcc restriction but unfortunately bumping the version will render the board unbootable.
there is a need to specially sign the uboot image.
I'm working on such support but up until I wasn't able to get the board to boot. due to the reasons mentioned above, I was not able to work on this in the past 3 weeks.
I hope to be able to resume work on this an finish soon.

Dagg.
