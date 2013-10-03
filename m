From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 3 Oct 2013 19:02:21 +0200
Subject: [Buildroot] Advice on a board support
In-Reply-To: <CA+TH9V=EdvEv4UF1s-ad9EoFCUBZHaoEqgiyqB1wsBUhETJZiQ@mail.gmail.com>
References: <CA+TH9V=EdvEv4UF1s-ad9EoFCUBZHaoEqgiyqB1wsBUhETJZiQ@mail.gmail.com>
Message-ID: <CAB0FRsvA=Mj0rbUc-7HxjwS3zYiGA1ivmJw-ZGQ+gZ=8geaq_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/10/3 Angelo Compagnucci <angelo.compagnucci@gmail.com>:
> Hi all,
>
> Recently I discovered the OLinuxIno nano board form Olimex and I
> really loved every corner of that!
>
> Now I really want to build a rootfs with buildroot, but unfortunately
> I discovered the board is not supported.
>

Since BR-2013.08, imx233_olinuxino was added (see
http://git.buildroot.net/buildroot/tree/board/olimex/imx233_olinuxino)
I think that covers MAXI, MINI, MICRO, NANO variants (but not their
A13, A10S, A20 Allwinner based boards)

Fran?ois

> I really would like to contribute to the buildroot project supporting
> this board, but this will be my first contribution. I read several
> docs and I have a last question open.
>
> To make this board fully operative, several patches should be applied
> to some specific versions of the linux kernel. Patches are ready
> available[1] but how integrate them with boildroot?
>
> So my question is: what is the recommended way to support this new platform?
>
> Thank you!
>
>
> [1] https://github.com/RobertCNelson/armv5_devel/tree/v3.11.x-imxv5/patches
>
> --
> Profile: http://it.linkedin.com/in/compagnucciangelo
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
