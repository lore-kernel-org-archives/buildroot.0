From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jun 2012 09:18:51 +0200
Subject: [Buildroot] RPC and Busybox
In-Reply-To: <1340765700.13686.18.camel@kepler.gfxmuse.org>
References: <20120627000701.506f534e@skate>
 <1340765700.13686.18.camel@kepler.gfxmuse.org>
Message-ID: <20120627091851.72559c7a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 26 Jun 2012 20:55:00 -0600,
"Michael J. Hammel" <buildroot@graphics-muse.org> a ?crit :

> I'm not sure what to look for here.  I'm using glibc toolchain built
> with Crosstool-NG 1.15.1, Busybox 1.20.1, Buildroot 2012.05.  It
> doesn't look like there is a sunrpc/rpc/rpc.h in the toolchain.  
> 
> Any thoughts on what I should look at here?

Which glibc version are you using? Most likely, you're using glibc 2.14
or 2.15, which don't have RPC support, as was discussed in my e-mail.
For now, there is no solution besides reverting to glibc 2.13, until we
get libtirpc packaged and integrated into Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
