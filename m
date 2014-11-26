From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 22:00:17 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-11-22
In-Reply-To: <1417035454.5064.12.camel@abrodkin-8560l.internal.synopsys.com>
References: <20141123073011.CCE601014E6@stock.ovh.net>
 <CAHXCMM+JcRY090g3jcYGOzahveW2gYzKu_=QaDGmP2JTBXcRMQ@mail.gmail.com>
 <20141123182619.23fbfdba@free-electrons.com>
 <CAHXCMMKM4PHGDAD0SMZuXSX-ksB+j6tR_r1JPhoi7HNVGatuzA@mail.gmail.com>
 <1417033136.5064.8.camel@abrodkin-8560l.internal.synopsys.com>
 <CAHXCMM+odCUZoAWVJPuCOvf8ic1BMTZabBZDerwy9PqPs-mJUA@mail.gmail.com>
 <1417035454.5064.12.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <20141126220017.138c933c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Wed, 26 Nov 2014 20:57:34 +0000, Alexey Brodkin wrote:

> For example in "radvd" I'm going to do it with simple inclusion of:
> --->---
> AC_CHECK_FUNCS(sysctl)
> --->---
> in "configure.ac".

Did you notice that this is already done?

See
http://git.buildroot.net/buildroot/commit/?id=cb54da1b03f2e6d684416c614021735dfe276606.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
