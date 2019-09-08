From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 8 Sep 2019 08:24:01 -0600
Subject: [Buildroot] [PATCH/next 1/1] package/systemd: drop
 host-intltool dependency
In-Reply-To: <20190908145220.10f5f83d@windsurf>
References: <20190812175809.27786-1-fontaine.fabrice@gmail.com>
 <5d749986d4842_b182acfecbe864c960f8@ultri5.mail>
 <CAPi7W82MAEs3gSzqG49Vu3Sx3kSbOxt-3eBV51VCy327nghung@mail.gmail.com>
 <20190908145220.10f5f83d@windsurf>
Message-ID: <CADvTj4o82PCwgaZ_-O7Kf8cbWHD4SMyjVmQV6wvL8+-iM5inGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 8, 2019 at 6:52 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun, 8 Sep 2019 09:58:54 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > > Can you investigate this?
> > I think it should be fixed by adding host-gettext to
> > SYSTEMD_DEPENDENCIES. Could you check if it fixes the build failure?
> > I'll then send a patch.
>
> So systemd would need host-gettext even when NLS is disabled ?
Think so unless you do something like this:
https://github.com/systemd/systemd/pull/11294/files#diff-b29c598ec532831e56a6d4ae6d557e0fR4
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
