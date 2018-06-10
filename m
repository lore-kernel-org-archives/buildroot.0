From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Jun 2018 20:02:14 +0200
Subject: [Buildroot] [PATCH 1/1] pixiewps: fix static linking with
 uclibc-ng
In-Reply-To: <20180610154905.096c55e6@windsurf>
References: <20180609135820.2002-1-fontaine.fabrice@gmail.com>
 <20180610154905.096c55e6@windsurf>
Message-ID: <CAPi7W81Zy39Zb7zN1GF0TcpBARMXz3CYdKpL+WvUJ7zEGnDzAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2018-06-10 15:49 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Sat,  9 Jun 2018 15:58:20 +0200, Fabrice Fontaine wrote:
>
> > +PIXIEWPS_MAKE_OPTS = \
> > +     $(TARGET_CONFIGURE_OPTS) \
> > +     PREFIX=/usr
>
> Why are you introducing PIXIEWPS_MAKE_OPTS instead of using
> TARGET_CONFIGURE_OPTS directly ?
>
I wanted to use this new variable to pass future options such as OPENSSL
but you're right this is not needed for this fix.

>
> Indeed your change also has the consequence of passing PREFIX=/usr at
> build time. Is this necessary ? This seems like an unrelated change.
>
No it's not necessary, I will send a v2 of this patch.

>
> By the way, are you on IRC ?
>
Nope, but I can join if needed.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180610/d34c81bc/attachment.html>
