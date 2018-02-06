From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Feb 2018 14:44:36 +0100
Subject: [Buildroot] [PATCH 5/5] package/glibc: bump to 2.27
In-Reply-To: <20180206105019.tqnsw3i5l44mt5vs@tarshish> (Baruch Siach's
 message of "Tue, 6 Feb 2018 12:50:19 +0200")
References: <20180205205716.4279-1-romain.naour@gmail.com>
 <20180205205716.4279-5-romain.naour@gmail.com>
 <20180205210150.ok3hhfucmxu3uz3l@tarshish>
 <cfa2c67c-d3c8-81cd-7f50-60de1834d1ed@mind.be>
 <20180206105019.tqnsw3i5l44mt5vs@tarshish>
Message-ID: <87d11itepn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Arnout,
 > On Tue, Feb 06, 2018 at 09:18:38AM +0100, Arnout Vandecappelle wrote:
 >> On 05-02-18 22:01, Baruch Siach wrote:
 >> > On Mon, Feb 05, 2018 at 09:57:16PM +0100, Romain Naour wrote:
 >> >> See: https://sourceware.org/ml/libc-announce/2018/msg00000.html
 >> >> https://sourceware.org/glibc/wiki/Release/2.27
 >> > Note that this is a security bump fixing CVE-2017-1000408, CVE-2017-1000409, 
 >> > CVE-2017-16997, CVE-2018-1000001, and CVE-2018-6485.
 >> 
 >> Even though this release fixes a number of CVEs, I wouldn't call it a security
 >> bump. Indeed, it also makes a number of potentially breaking feature updates,
 >> cfr. the memfd_create() change.
 >> 
 >> So, I would indeed mention the CVE numbers in the commit message, but not put
 >> "security bump" in the title so that it doesn't mindlessly get applied to LTS
 >> branches.
 >> 
 >> Now, in this particular case we made enough noise about it that it really
 >> doesn't matter what goes into the subject line :-) However I think it's good to
 >> converge on some conventions on how to tag LTS things.

 > I agree that this bump might not be suitable for the maintenance branches. But 
 > I think we should consider it for the master branch, especially since we are 
 > still early in the -rc cycle.

Possibly, yes. Lets see how much blows up on next. Do you know if (some
of) these issues are also fixed on the 2.26 branch?

-- 
Bye, Peter Korsgaard
