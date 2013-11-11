From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 11 Nov 2013 22:35:49 +0100
Subject: [Buildroot] [PATCH 6 of 6 v2] legal info: update documentation
 with split target/host output
In-Reply-To: <CAAXf6LWZRQ-nbQJN4EqKdLwEADw4myFkFRqHLT12qZBvd6ehbw@mail.gmail.com>
References: <patchbomb.1381151707@argentina>
 <80513bfceb0f901ca09a.1381151713@argentina>
 <CAAXf6LWZRQ-nbQJN4EqKdLwEADw4myFkFRqHLT12qZBvd6ehbw@mail.gmail.com>
Message-ID: <CAHXCMMLnt5Gq7J9dkFt1FSkzju0XTzDZ5dpenkUZT=CKmSBL+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/11/11 Thomas De Schampheleire <patrickdepinguin@gmail.com>

> On Mon, Oct 7, 2013 at 3:15 PM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
> > Signed-off-by: Thomas De Schampheleire <
> thomas.de.schampheleire at gmail.com>
>
Acked-by: Samuel Martin <s.martin49@gmail.com>

>
> > ---
> > v2: new patch
> >
> >  docs/manual/legal-notice.txt |  15 +++++++++------
> >  1 files changed, 9 insertions(+), 6 deletions(-)
> >
> > diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
> > --- a/docs/manual/legal-notice.txt
> > +++ b/docs/manual/legal-notice.txt
> > @@ -39,16 +39,19 @@ There you will find:
> >  * +buildroot.config+: this is the Buildroot configuration file that is
> usually
> >    produced with +make menuconfig+, and which is necessary to reproduce
> the
> >    build.
> > -* The source code for all packages; this is saved in the +sources/+
> > -  subdirectory (except for proprietary packages, whose source code is
> not
> > -  saved);
> > -  patches applied to some packages by Buildroot are distributed with the
> > -  Buildroot sources and are not duplicated in the +sources/+
> subdirectory.
> > -* A manifest file listing the configured packages, their version,
> license and
> > -  related information.
> > +* The source code for all packages; this is saved in the +sources/+ and
> > +  +host-sources/+ subdirectories for target and host packages
> respectively.
> > +  The source code for packages that set +<PKG>_REDISTRIBUTE = NO+ will
> not be
> > +  saved.
> > +  Patches applied to some packages by Buildroot are distributed with the
> > +  Buildroot sources and are not duplicated in the +sources/+ and
> +host-sources/+
> > +  subdirectories.
> > +* A manifest file (one for host and one for target packages) listing the
> > +  configured packages, their version, license and related information.
> >    Some of this information might not be defined in Buildroot; such
> items are
> >    marked as "unknown".
> > -* A +licenses/+ subdirectory, which contains the license text of
> packages.
> > +* The license texts of all packages, in the +licenses/+ and
> +host-licenses/+
> > +  subdirectories for target and host packages respectively.
> >    If the license file(s) are not defined in Buildroot, the file is not
> produced
> >    and a warning in the +README+ indicates this.
> >
> > @@ -72,7 +75,7 @@ License abbreviations
> >  ---------------------
> >
> >  Here is a list of the licenses that are most widely used by packages in
> > -Buildroot, with the name used in the manifest file:
> > +Buildroot, with the name used in the manifest files:
> >
> >  * `GPLv2`:
> >    http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[
>
> This patch, together with the first one in this series, are the only
> ones that still need a review, all others have been Acked by Luca.
>
> It would be great if this could get in 2013.11...
>
> Thanks a lot,
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131111/9d591251/attachment.html>
