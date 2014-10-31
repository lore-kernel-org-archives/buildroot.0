From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 31 Oct 2014 17:23:47 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-30
In-Reply-To: <20141031073016.162E2100B71@stock.ovh.net>
References: <20141031073016.162E2100B71@stock.ovh.net>
Message-ID: <5453C5A3.4080506@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

On 10/31/2014 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2014-10-30

>     mips64el | tvheadend-596b4e0b29937a612... | NOK | http://autobuild.buildroot.net/results/3aaa28eb4fd04a5b578c5128b57ce89165e473be/
>     mips64el | tvheadend-596b4e0b29937a612... | NOK | http://autobuild.buildroot.net/results/467df0fde737de0ec89fe023b2ce33546543d335/

tvheadend fails to build with Python3.

Reported upstream: https://tvheadend.org/issues/2444

Should we make this packages depend on !BR2_PACKAGE_PYTHON3 until
upstream fixes the problem?

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
