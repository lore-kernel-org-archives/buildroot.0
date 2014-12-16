From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Dec 2014 21:02:51 +0100
Subject: [Buildroot] Buildroot autobuilders - Cleanup faulty tarballs
In-Reply-To: <20141216173149.GA4192@free.fr>
References: <20141215230340.GB4075@free.fr>
 <20141216080256.09901ee4@free-electrons.com>
 <20141216173149.GA4192@free.fr>
Message-ID: <20141216210251.0bb2fe67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 16 Dec 2014 18:31:49 +0100, Yann E. MORIN wrote:

> >  * Probably a higher number of reports about failed downloads, since
> >    wiping out the download directory means that the next builds will
> >    re-download everything they need, which gives a higher probability
> >    of downloading tarballs that have disappeared, or trying to reach
> >    hosts that are down, etc.
> 
> Are you running your instances without a backup mirror configured? I
> believe this is a good thing, because it will help find the missing
> upstreams.

Nope, I'm using the regular Buildroot configuration, so it does use
sources.buildroot.net.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
