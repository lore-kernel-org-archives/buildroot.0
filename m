From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sun, 23 Feb 2014 18:50:53 +0000 (UTC)
Subject: [Buildroot] What's the buildroot attitude to u-boot building?
References: <CAE21AQqMQmKKL0=Q55P2zQhV8+iBdpX416xK+SgZd3+ONi8Mgg@mail.gmail.com>
 <le7p26$n75$1@ger.gmane.org> <20140222000428.77575be9@skate>
 <leb2a2$688$1@ger.gmane.org> <20140223111839.1ef569b9@skate>
Message-ID: <ledfud$cnf$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-02-23, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> I guess here it's really a matter of taste.

True.

> I've seen a large of number of people/companies who really like the
> fact that one *single* Buildroot configuration is building their
> entire embedded Linux system: toolchain, rootfs, kernel and
> bootloader images.

If those make up the entire embedded Linux system, then that would be
convenient.

> It is indeed clear that Buildroot used to be mainly aimed at
> "integration", not to be used during development work.
>
> However, based on what you say, it really looks like you have never
> looked at using <pkg>_OVERRIDE_SRCDIR together with "make
><pkg>-rebuild", because they do precisely what you're looking for :-)

Indeed, I wasn't aware of those. It looks like they were added after I
decided to build kernel and boot-loader independently.
