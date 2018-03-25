From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 23:21:46 +0200
Subject: [Buildroot] [PATCH] wine: Depend on shared libraries
In-Reply-To: <20180315221629.499d56df@windsurf>
References: <1521143154-19605-1-git-send-email-nerv@dawncrow.de>
 <20180315221629.499d56df@windsurf>
Message-ID: <20180325232146.468ab64b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andr?,

On Thu, 15 Mar 2018 22:16:29 +0100, Thomas Petazzoni wrote:

> On Thu, 15 Mar 2018 20:45:54 +0100, Andr? Hentschel wrote:
> > Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> > ---
> >  package/wine/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/package/wine/Config.in b/package/wine/Config.in
> > index 627a9a7..52d7d2e 100644
> > --- a/package/wine/Config.in
> > +++ b/package/wine/Config.in
> > @@ -1,5 +1,6 @@
> >  config BR2_PACKAGE_WINE
> >  	bool "wine"
> > +	depends on !BR2_STATIC_LIBS  
> 
> It would be good to explain in the commit log why you're adding this,
> and perhaps add a comment on top of this line to explain why we have
> this dependency.

Ping ? :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
