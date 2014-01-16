From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 16 Jan 2014 09:24:06 +0100
Subject: [Buildroot] [PATCH] tvheadend: disable when NPTL is missing
In-Reply-To: <20140116082053.GA4602@tarshish> (Baruch Siach's message of "Thu, 
 16 Jan 2014 10:20:53 +0200")
References: <ab66cde1a0e02e60b0238a227bf982aa22f8eac5.1389858574.git.baruch@tkos.co.il>
 <87ob3cqr30.fsf@dell.be.48ers.dk> <20140116082053.GA4602@tarshish>
Message-ID: <87k3e0qqqh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Thu, Jan 16, 2014 at 09:16:35AM +0100, Peter Korsgaard wrote:
 >> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
 >> 
 >> > Fixes
 >> > http://autobuild.buildroot.net/results/0ae/0ae5c5158215a48d4d4849f52837bbe4b36db381/.
 >> 
 >> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 >> 
 >> Committed, thanks.

 > Thanks. What about the similar rt-tests patch 
 > (http://patchwork.ozlabs.org/patch/309709/)?

I'll handle it now. I know Thomas disagreed, but I think it makes sense.

-- 
Bye, Peter Korsgaard
