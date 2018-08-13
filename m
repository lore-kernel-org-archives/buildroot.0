From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 13 Aug 2018 06:23:51 -0700
Subject: [Buildroot] [PATCH 01/17] perl-cgi: add host
In-Reply-To: <20180812141147.5942e27f@windsurf>
References: <20180811182749.20924-1-chrismcc@gmail.com>
 <20180811182749.20924-2-chrismcc@gmail.com>
 <20180812141147.5942e27f@windsurf>
Message-ID: <CALURroQgb6YPhoUUBB3fxopuxjg0Qp+T7KRT_Gy8jy+Cr6LKuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello

On Sun, Aug 12, 2018 at 5:11 AM, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Christopher,
>
> On Sat, 11 Aug 2018 11:27:33 -0700, Christopher McCrory wrote:
> > Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> > ---
> >  package/perl-cgi/perl-cgi.mk | 2 ++
> >  1 file changed, 2 insertions(+)
>
>
> Please be careful when ordering the patches: they should be organized
> in the correct order to make sure that everything builds at every point
> of the series.
>
>

Sorry about that, I did spend a lot of time getting them in the correct
order.  Somehow I missed this one.  After a while they all started bluring
together :)





> In this specific example, you should have the following order:
>
>  (1) Introduce host-perl-html-tagset
>
>  (2) Introduce host-perl-html-parser, which uses host-perl-html-tagset
>
>  (3) Introduce host-perl-cgi, which uses host-perl-html-parser
>
> Does that make sense ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>



-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180813/8480682d/attachment.html>
