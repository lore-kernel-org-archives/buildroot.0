From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 12:32:52 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-18
In-Reply-To: <53523738.4020409@openwide.fr>
References: <20140419063009.6CB4810148A@stock.ovh.net>
 <20140419090850.339ca98f@skate> <53523738.4020409@openwide.fr>
Message-ID: <20140419123252.6147c733@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 19 Apr 2014 10:43:36 +0200, Romain Naour wrote:

> > checking host system alignment requirements... checking for a Python interpreter with version >= 2.7... none
> > configure: error: no suitable Python interpreter found
> > make: *** [/home/test/test/1/output/build/lttng-libust-2.4.0/.stamp_configured] Error 1
> > 
> > I think Romain Naour said the new version of lttng-libust was fixing
> > this. Romain, could you send a patch to bump lttng-libust?
> 
> Yes, but I think it would be better to keep all lttng tools in sync.
> lttng-tools 2.4.1
> lttng-modules 2.4.1
> lttng-ust 2.4.1
> and bump liburcu to 0.8.4 while we are at it.

Sure. I'm waiting for your patches :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
