From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 22 Jan 2014 14:10:31 -0800
Subject: [Buildroot] Patchwork oldest patches cleanup #6 (deadline
	February 2)
In-Reply-To: <CAAXf6LX2yqbapp6GBuN5qoT1R93CGD3NCLguY8fQhFoApJz2uw@mail.gmail.com>
References: <CAAXf6LX2yqbapp6GBuN5qoT1R93CGD3NCLguY8fQhFoApJz2uw@mail.gmail.com>
Message-ID: <CAJJ6jxvu=r8wn=LbLYtXW-Omyv4jwTLQPE5RuFHh9eYS9N82Vg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 20, 2014 at 1:06 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> All,
>
> Here is session 6 of the patchwork cleanup. For those who haven't
> followed previous sessions, here is a quick recap: every session we'll
> be posting the list of the 10 oldest patches, with the original patch
> contributors in copy. During two weeks, we have the opportunity to
> discuss the patch, whether it is still necessary or not, how it should
> be changed to be merged.
>
> In particular, I'm interested in knowing if the original contributor is
> still interested by the patch, or if someone else is interested in
> adopting the patch and sending an updated version, or if the patch no
> longer makes sense due to other changes made in Buildroot.
>
> All patches that have not received any comment or attention before the
> deadline will be removed from patchwork. This is aggressive, but we have
> many 'dead' patches sitting in patchwork, and this cannot work.
>
> Deadline for this session is February 2 (FOSDEM + Buildroot developer days!).
>
<snip>
> minimal dockstar setup
> Steve Calfee <stevecalfee@gmail.com>
> http://patchwork.ozlabs.org/patch/217639
>

I guess you might as well drop the patch. At the time before rpi, the
$30 retail dockstar was the cheapest linux computer you could buy. I
thought others might be interested, but have received no comments, so
don't bother with this.

It still builds and works fine, but with later kernels beyond 3.6.8 (I
think) they changed the kernel for device tree, and that broke my
uboot. Changing uboot is a very dangerous thing, risking bricking the
dockstar, so I have stopped at that kernel for now. Still a nice NAS
for home, though.

Regards, Steve
