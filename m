From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 08:54:49 +0200
Subject: [Buildroot] [PATCH 1/4] python-pycryptodomex: new package
In-Reply-To: <3c49d9fc-33b4-b6a3-22ee-e9285c1733bf@mind.be>
References: <20180922193631.14369-1-asafka7@gmail.com>
 <20181009155633.2ad54938@windsurf> <20181009201923.GL2869@scaer>
 <3c49d9fc-33b4-b6a3-22ee-e9285c1733bf@mind.be>
Message-ID: <20181011085449.09bb8b19@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Oct 2018 23:13:40 +0200, Arnout Vandecappelle wrote:

> >> Yann, Arnout, I'm interested by your opinion on this package.  
> > 
> > So, I would state something like:
> > 
> >     PYTHON_PYCRYPTODOMEX_LICENSE = \
> >         BSD-2c, \  
> 
>  BSD-2-Clause

I fixed that when applying.

> >         Public Domain (pycrypto original code), \
> >         OCB license (OCB cypher)  
> 
>  I would clarify this as "OCB patent license". The (OCB cypher) is not really
> useful IMO. Anyway OCB is not a cipher, it's a mode.
> 
>  In terms of license files, in addition to LICENSE.rst, I think we also need
> Doc/LEGAL/COPYRIGHT.pycrypto

Asaf, could you send a follow-up patch fixing this, according to Arnout
comments ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
