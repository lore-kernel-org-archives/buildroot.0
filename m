From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 15 Oct 2015 08:25:19 +0200
Subject: [Buildroot] [PATCH v2 1/1] luvi: new package
In-Reply-To: <561EC531.6080009@trzebnica.net>
References: <1444763952-29583-1-git-send-email-joerg.krause@embedded.rocks>
 <1444854939-6557-1-git-send-email-joerg.krause@embedded.rocks>
 <561EC531.6080009@trzebnica.net>
Message-ID: <1444890319.8317.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerzy,

On Mi, 2015-10-14 at 23:12 +0200, Jerzy Grzegorek wrote:
> Hi J?rg,
> 

[snip]

> > +LUVI_VERSION = 2.3.4
> > +LUVI_SOURCE = luvi-src-v$(LUVI_VERSION).tar.gz
> > +LUVI_SITE = https://github.com/luvit/luvi/releases/download/v$(LUV
> > I_VERSION)
> 
> The tag version is???v2.3.4???, so this should be rather
> 
> LUVI_VERSION = v2.3.4
> LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
> LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VE
> RSION)
> 

You're right, although this is only necessary for the github helper.?

However, since luvi identifies itself as "luvi v2.3.4" I changed the
version string as suggested.

Many thanks!

Best regards
J?rg Krause
