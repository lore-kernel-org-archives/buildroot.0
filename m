From: John Voltz <john.voltz@gmail.com>
Date: Mon, 21 Jul 2008 09:25:38 -0400
Subject: [Buildroot] lxdoom - only supported if you have an X server?
In-Reply-To: <1216644796.21551.8.camel@localhost>
References: <1216644796.21551.8.camel@localhost>
Message-ID: <46a136670807210625u1407699el243983835865607f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As far as I can tell, lxdoom only works with X, there is no DirectFB or SDL
support in it. I think there is another doom port that does use SDL, that
was the one you used in your youtube video wasn;'t it? :^)

John


On Mon, Jul 21, 2008 at 8:53 AM, Hans-Christian Egtvedt <
hans-christian.egtvedt@atmel.com> wrote:

> The lxdoom package should "depend on BR2_PACKAGE_XORG7"?
>
> --
> With kind regards,
> Hans-Christian Egtvedt, Applications Engineer
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080721/8d550175/attachment.htm 
