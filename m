From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 28 Nov 2014 19:38:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_bdftopcf: Fix
	linking error
References: <1417035000-22176-1-git-send-email-bernd.kuhls@t-online.de>
 <87d288nv8o.fsf@dell.be.48ers.dk>
Message-ID: <XnsA3F3C7B8B7566berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <peter@korsgaard.com> wrote in 
news:87d288nv8o.fsf at dell.be.48ers.dk:

> > +# needed for linking against libXfont
> > +XAPP_BDFTOPCF_MAKE_OPTS += LDFLAGS+=-ldl
> 
> Does this end up at the very back of the linker command line? Why not
> XAPP_BDFTOPCF_CONF_ENV += LIBS=-ldl like we do elsewhere?

Hi Peter,

I had no particular reason for my choice, it works as good as your proposal, 
so I sent v2: http://patchwork.ozlabs.org/patch/415933/

Regards, Bernd
