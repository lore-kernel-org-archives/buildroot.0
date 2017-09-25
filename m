From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Sep 2017 18:20:56 +0200
Subject: [Buildroot] [PATCH 38/49 v2] package/libpjsip: add option to
 enable G.711 codec
In-Reply-To: <5b53a258-aab7-a965-7c37-13af59943fbf@mind.be>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <528297671d94a208c1c5a18e1bb34895347da626.1504993178.git.yann.morin.1998@free.fr>
 <5b53a258-aab7-a965-7c37-13af59943fbf@mind.be>
Message-ID: <20170925162056.GB2985@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-09-23 19:06 +0200, Arnout Vandecappelle spake thusly:
> On 09-09-17 23:39, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/libpjsip/Config.in   | 3 +++
> >  package/libpjsip/libpjsip.mk | 5 ++++-
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
> > index 0bb446e9d9..1c9d2ce900 100644
> > --- a/package/libpjsip/Config.in
> > +++ b/package/libpjsip/Config.in
> > @@ -12,6 +12,9 @@ config BR2_PACKAGE_LIBPJSIP
> >  
> >  if BR2_PACKAGE_LIBPJSIP
> >  
> > +config BR2_PACKAGE_LIBPJSIP_CODEC_G711
> > +	bool "G.711 codec"
> 
>  I believe this codec (and the other ones as well) is rather small. Is there any
> reason to make it optional?

Please see my reply to your comment on adding the GSM codec.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
