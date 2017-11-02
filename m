From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 09:06:31 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171102023131.GK1829@waldemar-brodkorb.de>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
 <CANQCQpYxR6nParzHgEswkZyh8K2-DUHnTu5VsOtyJOksd3rU5w@mail.gmail.com>
 <20171101104532.43dcd164@windsurf>
 <1509530473.6560.11.camel@synopsys.com>
 <20171101112428.710e7181@windsurf>
 <20171102023131.GK1829@waldemar-brodkorb.de>
Message-ID: <20171102090631.61714814@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Nov 2017 03:31:31 +0100, Waldemar Brodkorb wrote:

> > I was surprised because our configuration
> > https://git.buildroot.org/buildroot/tree/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
> > is using gcc 7.x. But what I missed is that it's a glibc configuration,
> > and argp-standalone is only available for !glibc configurations.
> > 
> > So that explains it all.  
> 
> Just as a sidenote, uClibc-ng does include argp support
> if enabled via UCLIBC_HAS_ARGP. Is argp-standalone used for musl
> toolchains, too?

Yes, we also use it for musl, so it makes to keep it as a separate
library I believe.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
