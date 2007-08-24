From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 24 Aug 2007 14:59:45 +0100
Subject: [Buildroot] buildroot for avr32
In-Reply-To: <00d401c7e655$5d036260$6e00a8c0@JONATHAN>
References: <00d401c7e655$5d036260$6e00a8c0@JONATHAN>
Message-ID: <d6cda7730708240659q612e813l134c00d238ca6590@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jonathan,

   I'm using the svn buildroot with avr32, and I'm running into my
fair share of issues, so I guess the Atmel snapshot might be a safer
bet. But I really don't like that they have removed the .svn folders
from the package, making it a lot harder to get updates from the
buildroot guys. Well, svn is catching up quite rapidly, and I have
been able to build what I needed so far. I have never built GTK+
thought.

   I have recently managed to merge the Atmel snapshot with svn to
some extent. But I haven't gone thru the resulting patch to sort out
what should be submitted and what should be discarded.

Cheers,
    Thiago A. Correa


On 8/24/07, Jonathan Dumaresq <jdumaresq@cimeq.qc.ca> wrote:
>
>
> Hi all,
>
> I just try to get buildroot (from atmel site) build for the avr32. I would
> like to know if i should the latest (from the svn) or use the one from
> atmel. ?
>
> I have also another question. On my rootfs, i will need (if possible) to
> have a graphics web browser on a NGW100 board connected to an lcd. I have
> seen some browser build on top of gtk+ library. I would like to know if this
> is include in the avr32 port of buildroot ?
>
> regards
>
> Jonathan Dumaresq
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
