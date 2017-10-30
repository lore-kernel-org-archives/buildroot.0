From: Gorka Lertxundi <glertxundi@gmail.com>
Date: Mon, 30 Oct 2017 23:35:21 +0100
Subject: [Buildroot] Unable to build an image with systemd
In-Reply-To: <87she0i8vu.fsf@dell.be.48ers.dk>
References: <CAJCNcEb8aemsJ3YrRwK78mv_XTAOsTx54mWaGBoy22uF6zAynA@mail.gmail.com>
 <20171030153510.35066d4a@windsurf>
 <CAJCNcEb4+FOpcFD7ES6EHGtwWegY3WLxtFc6SsOS-ziY3dg-7g@mail.gmail.com>
 <87she0i8vu.fsf@dell.be.48ers.dk>
Message-ID: <CAJCNcEbO0kejSr4Sta=6oY59-Frpm5+gWB5sqVKYiwbxG1KLMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas,

Sorry for wasting your time, I thought I already did a clean because I'm
building buildroot inside an ephemeral docker container and this shouldn't
happen (I was caching buildroot through a shared volume...). The build
didn't finish yet but it seems that systemd phase was successfully passed.

Thanks for your support.

2017-10-30 23:11 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Gorka" == Gorka Lertxundi <glertxundi@gmail.com> writes:
>
> Hi,
>
>  > I started taking the customizations from jumpnow (
>  > https://github.com/jumpnow/buildroot) and include them one-by-one on
> the
>  > original buildroot but when I changed from sysv to systemd this one
> failed
>  > to build.
>
> Just to be sure - You did a make clean when you changed from sysv to
> systemd, right?
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171030/9fb517d3/attachment.html>
