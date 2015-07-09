From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jul 2015 11:29:58 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-07-08
In-Reply-To: <87lheplrzc.fsf@dell.be.48ers.dk>
References: <20150709063009.DE905100B0F@stock.ovh.net>
 <87lheplrzc.fsf@dell.be.48ers.dk>
Message-ID: <20150709112958.43329535@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Thu, 09 Jul 2015 09:17:43 +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Build statistics for 2015-07-08
>  > ===============================
> 
>  >         success : 2  
>  >        failures : 1  
>  >        timeouts : 0  
>  >           TOTAL : 3  
> 
> Huh, what happened?

Amongst the new toolchain configurations listed in the toolchain CSV
file, there was one typo: the toolchain config URL was invalid. Due to
this, the Python script has aborted on all autobuilder slaves.

I've fixed the typo now
(http://git.buildroot.net/buildroot-test/commit/?id=00e2fb0d241eb2e2f0e9bac35f24d729b2c0d8a2),
and restarted the autobuilder slaves on the Free Electrons build
machine and on gcc75.

Could you please restart your autobuilders? Also same for Richard.

Sorry for the mess :-/ The autobuild-run script should maybe be a bit
more robust against such kind of problems. Patches welcome!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
