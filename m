From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 22:30:51 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-11-22
In-Reply-To: <1417036747.5064.19.camel@abrodkin-8560l.internal.synopsys.com>
References: <20141123073011.CCE601014E6@stock.ovh.net>
 <CAHXCMM+JcRY090g3jcYGOzahveW2gYzKu_=QaDGmP2JTBXcRMQ@mail.gmail.com>
 <20141123182619.23fbfdba@free-electrons.com>
 <CAHXCMMKM4PHGDAD0SMZuXSX-ksB+j6tR_r1JPhoi7HNVGatuzA@mail.gmail.com>
 <1417033136.5064.8.camel@abrodkin-8560l.internal.synopsys.com>
 <CAHXCMM+odCUZoAWVJPuCOvf8ic1BMTZabBZDerwy9PqPs-mJUA@mail.gmail.com>
 <1417035454.5064.12.camel@abrodkin-8560l.internal.synopsys.com>
 <20141126220017.138c933c@free-electrons.com>
 <1417036747.5064.19.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <20141126223051.1c335f25@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Wed, 26 Nov 2014 21:19:07 +0000, Alexey Brodkin wrote:

> No unfortunately I didn't noticed this change.
> I don't follow mailing list regularly so it would be helpful if you add
> me explicitly in Cc if I might be interested in stuff :)

I think I had the intention of doing it, but forgot it when actually
sending the patches. Sorry about that.

> And frankly I'm not sure if we need to check for a header still.
> So in your patch I would simply replace HAVE_SYS_SYSCTL_H with
> HAVE_SYSCTL in "device-linux.c".

Yes, I agree this is arguable.

> Also I was going to push my change upstream in radvd and already made a
> pull-request https://github.com/reubenhwk/radvd/pull/37 but with your
> help I realized that I forgot to modify "device-linux.c".

Hehe :-)

In any case, if you submit a fix upstream, next time we upgrade, we'll
get your version.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
