From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 19 Apr 2014 10:43:36 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-18
In-Reply-To: <20140419090850.339ca98f@skate>
References: <20140419063009.6CB4810148A@stock.ovh.net>
 <20140419090850.339ca98f@skate>
Message-ID: <53523738.4020409@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> 
>>        arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/a6f5550cc63260126cb66a954af60f1633b97faf/
> 
> checking host system alignment requirements... checking for a Python interpreter with version >= 2.7... none
> configure: error: no suitable Python interpreter found
> make: *** [/home/test/test/1/output/build/lttng-libust-2.4.0/.stamp_configured] Error 1
> 
> I think Romain Naour said the new version of lttng-libust was fixing
> this. Romain, could you send a patch to bump lttng-libust?

Yes, but I think it would be better to keep all lttng tools in sync.
lttng-tools 2.4.1
lttng-modules 2.4.1
lttng-ust 2.4.1
and bump liburcu to 0.8.4 while we are at it.

Best regards,
Romain
