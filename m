From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 06:25:06 -0500
Subject: [Buildroot] [PATCH] boot/gummiboot: updated url
In-Reply-To: <20180920041956.rnukojrawrxyxmlr@sapphire.tkos.co.il>
References: <1537382487-35071-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180920041956.rnukojrawrxyxmlr@sapphire.tkos.co.il>
Message-ID: <CANQCQpZ_Nu5-haJM9RZmRELwoAzuCsnJ0Z3hEa8gh13MmmGb1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Wed, Sep 19, 2018 at 11:20 PM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Matt
>
> On Wed, Sep 19, 2018 at 01:41:27PM -0500, Matt Weber wrote:
> > From: Matt Weber <matt@thewebers.ws>
> >
>
> Missing sign-off.

Thanks for the review.  I sent this and another url update patch to
soon without my signed-off. I've rejected them in patchwork and will
resend.

>
> > ---
> >  boot/gummiboot/Config.in | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/boot/gummiboot/Config.in b/boot/gummiboot/Config.in
> > index 11dbc4f..57d8d59 100644
> > --- a/boot/gummiboot/Config.in
> > +++ b/boot/gummiboot/Config.in
> > @@ -20,4 +20,5 @@ config BR2_TARGET_GUMMIBOOT
> >         exactly the same, except that the Gummiboot configuration
> >         files will be located in /loader/ inside the EFI partition.
> >
> > -       http://freedesktop.org/wiki/Software/gummiboot/
> > +          https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/
>
> Indentation problem.
>

Noted will include a fix for indention and newline.

> There is no mention of Gummiboot in this URL. Maybe change the package name as
> well?

Or should I include a note in the help about the package being renamed?


Matt
