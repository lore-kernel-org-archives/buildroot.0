From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 15 Feb 2013 14:20:17 +0200
Subject: [Buildroot] [PATCHv5 2/2] wireshark: new package
In-Reply-To: <511E2637.4010008@petroprogram.com>
References: <f903151303143f85e1e9c69b1f20400af878be97.1359870806.git.baruch@tkos.co.il>
 <f41bbd107d237f76229f44b7d78fcec962c15309.1359870806.git.baruch@tkos.co.il>
 <510E53EB.7020704@petroprogram.com>
 <20130214045630.GA15440@sapphire.tkos.co.il>
 <511CFD48.8000300@petroprogram.com>
 <511D0638.90106@petroprogram.com>
 <511D0854.7010506@petroprogram.com>
 <20130215115112.GA1249@tarshish>
 <511E2637.4010008@petroprogram.com>
Message-ID: <20130215122013.GB1249@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

On Fri, Feb 15, 2013 at 02:12:39PM +0200, Stefan Fr?berg wrote:
> 15.2.2013 13:51, Baruch Siach kirjoitti:
> > On Thu, Feb 14, 2013 at 05:52:52PM +0200, Stefan Fr?berg wrote:
> > [...]
> >> It seems I need to upgrade to latest git version if I want this to work.
> >> That version of gnutls has
> >> --disable-rpath in it's conf.
> > Thanks for testing.
> >
> >> BTW, Baruch did you manage to compile this version of wireshark against
> >> that gnutls 3 ?
> > Nope. I only tried OpenSSL which I already have on my target.
> 
> Your .mk file needs --with-gnutls=no added to it's configuration in case
> both OpenSSL and gnutls are installed.
> And maybe later a submenu of choice what SSL (if any) implementation to
> use for decrypting.

Ok. I'll fix that in my next patch iteration.

> I will try later this evening how far I get this time with compiling it.

Keep me posted.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
