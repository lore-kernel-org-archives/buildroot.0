From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Aug 2019 22:26:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/giflib: security bump to
 version 5.2.1
In-Reply-To: <20190819214021.4a8138b2@windsurf.home>
References: <20190818120432.22829-1-fontaine.fabrice@gmail.com>
 <20190819154603.51a042a2@windsurf.home> <87ftlxgk37.fsf@dell.be.48ers.dk>
 <20190819214021.4a8138b2@windsurf.home>
Message-ID: <CAPi7W82Ft-zEoFOiedWNGde6fpSeeyGiGaCnD3onQpo9UT6o6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 19 ao?t 2019 ? 21:40, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Mon, 19 Aug 2019 19:07:24 +0200
> Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >  > I must say this is quite big of a change for master at this point, and
> >  > for a security bump in general. I'm not sure between applying this, or
> >  > just cherry-picking the two commits that fix the CVEs.
> >
> > Yes, I believe that is also what we agreed when Bernd posted a similar
> > patch last month:
> >
> > https://patchwork.ozlabs.org/patch/1124785/
>
> So in here you also say that the security issue is only in a tool we
> don't install, so we're not affected. In this case, I could just apply
> Fabrice's patch to next, and we do nothing for master ?
Why these CVEs only affects tools? As you can see in both links that I
provided, those CVEs are located in dgif_lib.c which is a part of
libgif and libgif is installed in staging. So I think that some of our
users could be concerned by these CVEs. Moreover, we are also
providing host-giflib which build and install host tools.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
