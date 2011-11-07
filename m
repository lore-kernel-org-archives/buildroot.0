From: Diego Iastrubni <diegoiast@gmail.com>
Date: Mon, 7 Nov 2011 13:02:50 +0200
Subject: [Buildroot] UDEV-172 problems, buildroot 2011.08, linux 2.6.33
In-Reply-To: <20111029141216.1efbddac@skate>
References: <CAMeaXtxK=Hf3MMSbJK+nHp8UZnFgkAEkef2n5CkwgaitNxvVYQ@mail.gmail.com>
 <20111029141216.1efbddac@skate>
Message-ID: <CALR4fE+p90Mj=93vjPNFNKW0+kTjB9+gF8eap3agN_bsmUyMHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 29, 2011 at 2:12 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Le Sat, 29 Oct 2011 13:25:44 +0200,
> Robin Theunis <robint91@gmail.com> a ?crit :
>
> > I have a small problem with udev-172. It fails to build with
> > buildroot. The target is a custom AT91RM9200 board, the kernel is
> > 2.6.33. Everything has OABI support.
> > Has someone an idea what is happening?
>
> Yes, 2.6.33 is too old to build a modern udev such as udev 172.
> Probably it can be workaround at udev level, I don't know how
> complicated it would be, though.
>
>
Just add a local patch to your buildroot to disable that code. I did
something similar on my system as I am using a non-supported toolchain. The
patches were sent here and to udev, but both parties refused them (and I do
not fell bad about it, they were right).
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111107/536e68d4/attachment.html>
