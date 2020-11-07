From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 7 Nov 2020 14:57:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/lzlib: add license file
In-Reply-To: <20201107141936.767f004a@windsurf.home>
References: <20201106214936.307864-1-fontaine.fabrice@gmail.com>
 <20201107141936.767f004a@windsurf.home>
Message-ID: <CAPi7W81MUo6MtP=zm6aU+gjpkL36b3k9+PXH1bH5XFTJRFzskQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le sam. 7 nov. 2020 ? 14:19, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Fri,  6 Nov 2020 22:49:36 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Add lzlib.c as the license file and, while at it, update indentation to
> > two spaces
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/lzlib/lzlib.hash | 3 ++-
> >  package/lzlib/lzlib.mk   | 1 +
> >  2 files changed, 3 insertions(+), 1 deletion(-)
>
> Applied to master, thanks. For those cases where we need to use a
> source file as the license file, I think it would be nice to contact
> upstream and suggest them to have a proper, separate, license file.
OK, I'll do it for projects that are still active.
Concerning lzlib, I fear that this is not the case as the last commit
has been made 5 years ago.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
