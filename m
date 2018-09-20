From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 15:35:14 -0500
Subject: [Buildroot] [PATCH 02/14] boot/at91bootstrap: URL update
In-Reply-To: <20180920221259.72b5b016@windsurf>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1537449899-9576-2-git-send-email-matthew.weber@rockwellcollins.com>
 <20180920221259.72b5b016@windsurf>
Message-ID: <CANQCQpa_4vmfdei0QacdPOiPXFVouWQcvjJZ1=94Jy3n0_+C4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 20, 2018 at 3:13 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Thu, 20 Sep 2018 08:24:47 -0500, Matt Weber wrote:
> > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> > ---
> >  boot/at91bootstrap/Config.in | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
> > index 0f6430f..3d649b1 100644
> > --- a/boot/at91bootstrap/Config.in
> > +++ b/boot/at91bootstrap/Config.in
> > @@ -10,6 +10,8 @@ config BR2_TARGET_AT91BOOTSTRAP
> >         - Physical media algorithm such as DataFlash, NandFlash, NOR
> >           Flash...
> >
> > +       https://www.at91.com/linux4sam/bin/view/Linux4SAM/LegacyAT91Bootstrap
>
> Actually, this one should use:
>
>           https://www.at91.com/linux4sam/bin/view/Linux4SAM/LegacyAT91Bootstrap
>

Ok so this patch is ok then and for the at91dataflashboot I found it
mentioned on the same legacy page but it definitely is a weak
reference.


> which you have used for at91dataflashboot, but at91dataflashboot is a
> different thing, which no longer has any upstream location.
>
> Perhaps your script should support a way of specifying "yeah, there is
> no upstream location" in an explicit way.

Is that maybe a string we put in the end of the help section?   "No
Upstream URL"

Matt
