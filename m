From: Mitch Davis <mjd+buildroot@afork.com>
Date: Wed, 7 Jul 2010 16:14:47 +1000
Subject: [Buildroot] init: I won't write compressed data to a terminal.
In-Reply-To: <87pqyz6dpa.fsf@macbook.be.48ers.dk>
References: <4C33AB4E.9050604@gmx.net> <87pqyz6dpa.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTilnNqLqTIu6gIGD7e2YNI0IR3Yc4m0SS1tNFWap@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 7, 2010 at 3:52 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Ossy" == Ossy ?<ossy1980@gmx.net> writes:
>
> ?Ossy> Hi buildroot mailinglist,
> ?Ossy> After successfully compiling a whole rootfs and mounting it via loop
> ?Ossy> on some nfs export I started my arm ebedded device and ran into tho
> ?Ossy> following error after booting the image via tftp.
>
> ?Ossy> "init: I won't write compressed data to a terminal."
>
> What .config are you using? That string doesn't exist in the busybox
> init (or anywhere in busybox).

It's a message from bzip2, I think.

Mitch.
