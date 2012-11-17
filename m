From: Juha Lumme <juha.lumme@gmail.com>
Date: Sat, 17 Nov 2012 22:34:02 +0900
Subject: [Buildroot] Built a file system,
 have a working kernel - how to login ?
In-Reply-To: <CABYt4-ZRHdmbCAwtt8+swiwRHNwg=0_zEJxe7UnxetBgudXGKg@mail.gmail.com>
References: <CAF-Ht3yZfCDAMpPGJ7NFd_RQ0brOwxw3pSSoA3YFtzVf7kpf2g@mail.gmail.com>
 <20121117111132.17a91542@skate>
 <CAF-Ht3xTA8gLLFS5j64LFSQ9_U5O7+42Uj0Yq4CMZWWZb3g3YA@mail.gmail.com>
 <20121117123531.431cbd65@skate>
 <CAF-Ht3zwxboYWZ6Q3ocMtFaAnQ9xEo+qfWfSsovdZuZa3sotkQ@mail.gmail.com>
 <20121117130703.03beb6e1@skate>
 <CABYt4-ZRHdmbCAwtt8+swiwRHNwg=0_zEJxe7UnxetBgudXGKg@mail.gmail.com>
Message-ID: <CAF-Ht3w505-MDPNBizt4EcWFC=rB9QH2-=eDrGbtn+-pxOf9TQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tomas, Shawn,

That was the problem! Now I get properly to the login prompt up! Thank you
guys so much! :)
Sigh, as always, I should have read the manual more carefully..

By the way, I also opened a question about this at Stack Overflow earlier,
so if you want earn some reputation in that forum, I'll pick your answer.
I'll answer it myself tomorrow, if you guys don't want/care about that
stuff.
http://stackoverflow.com/questions/13429068/buildroot-built-a-file-system-how-to-login-boot-hangs

Once again, thank you for your time!
Juha


On Sat, Nov 17, 2012 at 10:17 PM, Shawn Goff <shawnjgoff@gmail.com> wrote:

> > Please enable a tarball root filesystem image, and then extract is as
> > root on the partition of your memory card.
> >
>
> Since you said you're not yet familiar with Buildroot, I'll clarify
> that. Thomas is refering to the Buildroot option
> BR2_TARGET_ROOTFS_TAR. The resulting file is in output/images.
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121117/1c748946/attachment.html>
