From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 24 Feb 2014 10:12:49 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140223110021.16b6b976@skate>
References: <20140223073009.3676E101056@stock.ovh.net>
 <20140223110021.16b6b976@skate>
Message-ID: <530B1B21.6000200@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/23/2014 10:00 AM, Thomas Petazzoni wrote:
>>    mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/f9b3780c712ba7e3cbb871dcfd5123340be688b3/
>
> Cannot work in master, it needs the version bump in next. Should we
> disable ltp-testsuite build on mips64el in master?

Disabling this package for the new release is the best solution. If we 
know that it will fail then it has no sense to keep it enabled.

-- 
Vincent
