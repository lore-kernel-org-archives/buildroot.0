From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 12 Jun 2014 06:05:23 +0300
Subject: [Buildroot] [PATCH 1/1] Add support for gold linker and LTO for
 GCC.
In-Reply-To: <SNT146-W9705D7538E5C63461FC6CA82B0@phx.gbl>
References: <BLU436-SMTP187DA10D0CB5B02F7E271EEA8280@phx.gbl>
 <20140611031614.GT4074@tarshish>
 <SNT146-W9705D7538E5C63461FC6CA82B0@phx.gbl>
Message-ID: <20140612030522.GZ4074@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephen,

Please keep the list on Cc.

On Wed, Jun 11, 2014 at 11:35:12PM +0100, Stephen Thomas wrote:

> > > diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> > > index 08540a3..a6e5ba6 100644
> > > --- a/package/binutils/Config.in.host
> > > +++ b/package/binutils/Config.in.host
> > > @@ -1,5 +1,8 @@
> > >  comment "Binutils Options"
> > >  
> > > +config BR2_BINUTILS_SUPPORTS_GOLD
> > > +	bool "binutils 2.24"
> > 
> > Are you sure this needs to be user selectable? The comment string looks 
> > confusing, anyway.
>
> No I don't think so. I have a question that I haven't been able to find the 
> answer to. Has anyone had the linker plugin working with BFD? There was 
> meant to be support for this somewhere, I remember reading somewhere.

Maybe someone on the list knows the answer.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
