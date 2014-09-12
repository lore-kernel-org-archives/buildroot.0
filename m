From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 Sep 2014 10:00:43 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140912105704.065664a4@free-electrons.com>
References: <20140912063012.AF99B100DEE@stock.ovh.net>	<20140912101105.1e932cb8@free-electrons.com>	<5412B494.4070607@imgtec.com>
 <20140912105704.065664a4@free-electrons.com>
Message-ID: <5412B63B.3030603@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/12/2014 09:57 AM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Fri, 12 Sep 2014 09:53:40 +0100, Vicente Olivert Riera wrote:
>
>> One of them (sa_restorer) is very close to be fixed upstream. Maybe
>> today? Hopefully.
>>
>> To fix the other one (si_timerid) we need to patch uClibc, but that
>> patch will add some members to a struct, so that woulb be an ABI
>> breakage. We need to talk first to the person in maintaining uClibc for
>> MIPS and see what he thinks about this.
>
> So in the mean time, let's have a patch that disables building strace
> on MIPS with uClibc, no?
>
> Thomas

Yes, I'll do it now.


-- 
Vincent
