From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 19 Feb 2018 10:55:28 +0100
Subject: [Buildroot] [PATCH 1/3] imx-mkimage: new package
In-Reply-To: <CAPP7BN1iyQdwJvYhkLwtFQt4tc+adnYabknd3g3N1sEyD+yNAg@mail.gmail.com>
References: <1518960511-4823-1-git-send-email-karl.erik.larsson@gmail.com>
 <1518960511-4823-2-git-send-email-karl.erik.larsson@gmail.com>
 <20180218155100.3e4e090f@windsurf>
 <CAPP7BN1TZfMrNAbVaRFy1hOfi1Dnxht+0Q0z0=qKN-YPY8T0fA@mail.gmail.com>
 <20180219090254.05ce8a8f@windsurf.lan>
 <CAPP7BN1iyQdwJvYhkLwtFQt4tc+adnYabknd3g3N1sEyD+yNAg@mail.gmail.com>
Message-ID: <20180219095528.GA10694@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Erik,

On Mon, Feb 19, 2018 at 09:05:09AM +0100, Erik Larsson wrote:
> Hello,
> 
> 2018-02-19 9:02 GMT+01:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
> 
> > Hello Erik,
> >
> > On Mon, 19 Feb 2018 06:43:15 +0100, Erik Larsson wrote:
> >
> > > > > diff --git a/package/freescale-imx/imx-mkimage/0001-make-bl33-read-
> > env-variables.patch
> > > > b/package/freescale-imx/imx-mkimage/0001-make-bl33-read-
> > > > env-variables.patch
> > > > > new file mode 100644
> > > > > index 0000000..490eb05
> > > > > --- /dev/null
> > > > > +++ b/package/freescale-imx/imx-mkimage/0001-make-bl33-read-
> > > > env-variables.patch
> > > > > @@ -0,0 +1,37 @@
> > > > > +From 5ca549356ef889286c12b4d736d9026efafb8fff Mon Sep 17 00:00:00
> > 2001
> > > > > +From: Erik Larsson <erik.larsson@combitech.se>
> > > > > +Date: Mon, 29 Jan 2018 08:00:57 +0100
> > > > > +Subject: [PATCH] Add support for overriding BL32 and BL33 not only
> > BL31
> > > > > +
> > > > > +Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
> > > > > +Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
> > > > > +Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > > >
> > > > What is the upstream status of this patch ?
> > > >
> > > I've sent the patch to some of the developers, but still waiting for a
> > > reaction.
> >
> > OK. Then who are those other people who have Signed-off on your patch ?
> >
> My colleagues :)

Yep, we are fine with this.

> 
> >
> > > > Why are you building just the tool in iMX8M ? There is also one in src/
> > > > and in iMX8dv. What are the differences ? Should we build/install all
> > > > of them ? Conditionally ?
> > > >
> > > I'm currently only building for IMX8M because that's the only hardware I
> > > have access to. Preferably this should be conditional. Do you think I
> > shall
> > > add it as a conditional option right away event though I can't test it
> > > against other hardware?
> >
> > It's fine to support just what you need today. However, it would be
> > nice to explain it in the commit log and/or in a comment above those
> > lines in the .mk file.
> >
> Okay, I will fix that.
> 
> >
> > Thanks a lot!
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> > Embedded Linux and Kernel engineering
> > http://bootlin.com
> >
> 
> Thanks,
> Erik

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Best regards
Marcus Folkesson

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180219/a109dfed/attachment.asc>
