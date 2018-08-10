From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 15:12:57 -0700
Subject: [Buildroot] [PATCH 18/18] Add to DEVELOPERS file
In-Reply-To: <20180810231001.582f28e3@windsurf>
References: <20180810161502.21598-1-chrismcc@gmail.com>
 <20180810161502.21598-19-chrismcc@gmail.com>
 <20180810231001.582f28e3@windsurf>
Message-ID: <CALURroRWq6orbQpp4PRms_pOD3=eLfYXmMAwfT5Peev5hxD9dQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 10, 2018, 2:10 PM Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello,
>
> On Fri, 10 Aug 2018 09:15:02 -0700, Christopher McCrory wrote:
> > Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> > ---
> >  DEVELOPERS | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 215506c71c..c693f6765b 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -479,6 +479,25 @@ F:       package/python-rtslib-fb/
> >  F:   package/python-urwid/
> >  F:   package/targetcli-fb/
> >
> > +N:   Christopher McCrory <chrismcc@gmail.com>
> > +F:   package/perl-appconfig
> > +F:   package/perl-astro-suntime
> > +F:   package/perl-cgi
> > +F:   package/perl-class-std
> > +F:   package/perl-data-uuid
> > +F:   package/perl-date-manip
> > +F:   package/perl-dbi
> > +F:   package/perl-device-serialport
> > +F:   package/perl-file-slurp
> > +F:   package/perl-io-interface
> > +F:   package/perl-json-maybexs
> > +F:   package/perl-module-runtime
> > +F:   package/perl-number-bytes-human
> > +F:   package/perl-params-util
> > +F:   package/perl-sub-install
> > +F:   package/perl-sys-meminfo
> > +F:   package/perl-sys-mmap
>
> This should normally be done in each patch adding each individual
> package. Indeed, if I partially merge your patch series (say up to
> patch 10), then you won't be added to the DEVELOPERS file.
>
>
> I wasn't sure what to do.  If you accepted all but one in the middle, then
> the ones after it would all break.  Plus the four I sent earlier might
> conflict.  So I played it safe.  I have ten ish more that either depend on
> this series or are more complicated.  I can do those adds per commit.
>

Via phone so formatting might be off.



>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180810/475f9e96/attachment.html>
