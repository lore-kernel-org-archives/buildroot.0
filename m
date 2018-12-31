From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Dec 2018 13:43:05 +0100
Subject: [Buildroot] [PATCH 5/5 v5] boot/systemd-boot: new package
In-Reply-To: <20181226214100.GK14286@scaer> (Yann E. MORIN's message of "Wed, 
 26 Dec 2018 22:41:00 +0100")
References: <cover.1545814334.git.yann.morin.1998@free.fr>
 <d38239f86f99924e87dcb6e045b2de3ac0cb435f.1545814334.git.yann.morin.1998@free.fr>
 <20181226222329.18046c1c@windsurf> <20181226214100.GK14286@scaer>
Message-ID: <87pnthsw86.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,
 >> So it would be good to make sure we have a really solid use-case for
 >> adding this complexity.

 > Peter, care to elaborate your position, since you were advocating also
 > for it, earlier? ;-)

One interesting feature it has is that it can bundle the bootloader,
kernel, initramfs and kernel command line into a single EFI binary,
which can be handy for E.G. A/B boot and EFI secure boot.

But with that said, if upstream does not make it easy to build it
seperately, then I'm OK with only allowing it if systemd is built.

-- 
Bye, Peter Korsgaard
