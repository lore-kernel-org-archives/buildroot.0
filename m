From: Andreas Ziegler <br015@umbiko.net>
Date: Mon, 27 Jan 2020 16:07:26 +0100
Subject: [Buildroot] buildroot Digest, Vol 163, Issue 61
In-Reply-To: <mailman.11.1580126403.253964.buildroot@busybox.net>
References: <mailman.11.1580126403.253964.buildroot@busybox.net>
Message-ID: <96682a9834fc6354ff2ffb841cffac54@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Date: Mon, 27 Jan 2020 04:59:03 -0600 (CST)
> From: a <anushka.parashar@tesco.com>
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] vmlinuz on x86_64
> 
> It's still not working, now it is reading the grub.cfg file and shows 
> blank
> screen after that.
> 
> Can't figure out what actually is happening!

Do you have a frame buffer device configured in your kernel config? 
Legacy BIOS (needed for VGA text console) is disabled if you use UEFI 
boot.

Kind regards,
Andreas
