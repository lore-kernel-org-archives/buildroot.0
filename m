From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Nov 2011 23:16:42 +0000
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <87fwhlrqjm.fsf@macbook.be.48ers.dk>
References: <20111102160349.4afe5935@skate>
 <201111181751.22578.arnout@mind.be> <87fwhlrqjm.fsf@macbook.be.48ers.dk>
Message-ID: <201111182316.42534.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 18 November 2011 22:53:17 Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  Arnout>  To implement a clean-staging, we'll probably need to use the
>  Arnout>  copy-to-staging step of the external toolchains for all
>  Arnout>  toolchains.
> 
> Rather than handling both staging and target, I would prefer to move to
> generating target from staging just before the filesystems are created
> (similar to the other target-finalize stuff).

 Well...

 'make clean-target' is currently easy to implement.  Generating target 
from staging is not.  So I hope you don't mean that this preference would 
block the acceptance of 'make clean-target'.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
