From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 25 May 2019 15:50:30 +0200
Subject: [Buildroot] [PATCH/next v2,
 1/1] package/gpsd: bump to version 3.18.1
In-Reply-To: <CA+sos7_98x11EzSDV4Pep_1yfqVYANW18gSOHj-p254Ocsps=g@mail.gmail.com>
References: <20190524135745.8823-1-fontaine.fabrice@gmail.com>
 <CA+sos7_98x11EzSDV4Pep_1yfqVYANW18gSOHj-p254Ocsps=g@mail.gmail.com>
Message-ID: <CAPi7W80TK+f3Wz9w1uXjx4kQ_tFZk1GEW0+YMTLuhi4rsxOa=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t,

Le sam. 25 mai 2019 ? 13:51, Beno?t Th?baudeau
<benoit.thebaudeau.dev@gmail.com> a ?crit :
>
> Hi Fabrice,
>
> On Fri, May 24, 2019 at 3:57 PM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> >
> > - Remove second patch (already in version)
> > - Add a patch to fix build without man pages
> > - Add a patch to remove C99-style loop
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> > Changes v1 -> v2 (after review of Beno?t Th?baudeau):
> >  - Add second patch to fix C99-style loop
>
> [...]
>
> Good.
>
> I also see that BR2_PACKAGE_GPSD_MAX_CLIENT and
> BR2_PACKAGE_GPSD_MAX_DEV are broken because limited_max_clients and
> limited_max_devices have been renamed in 3.12 as max_clients and
> max_devices, respectively.
OK, I'll made a separate patch as this fix must be apply to master and not next.
>
> There is also a skytraq protocol that is supported and that could be
> added to the config.
I'll also send this as a separate patch as this is not related to
3.18.1, skytraq has been added in version 3.17.
>
> Best regards,
> Beno?t
Best Regards,

Fabrice
