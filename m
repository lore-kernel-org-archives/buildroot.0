From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 Jun 2021 09:21:18 +0200
Subject: [Buildroot] [PATCH] package/netperf: move SITE so s.b.n
In-Reply-To: <87v96wrw9p.fsf@tarshish> (Baruch Siach's message of "Wed, 02 Jun
 2021 20:50:26 +0300")
References: <c160b9eba623c54debf9bf50d69cca4a6d6ed69e.1622119840.git.baruch@tkos.co.il>
 <7d24aa70-74c4-1166-e69f-5d8c7a5c6875@mind.be>
 <a7969129-6272-575d-0846-1874629cebc4@mind.be>
 <87v96wrw9p.fsf@tarshish>
Message-ID: <87tumbxxu9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Arnout,
 > On Wed, Jun 02 2021, Arnout Vandecappelle wrote:
 >>>> -NETPERF_SITE = ftp://ftp.netperf.org/netperf
 >>>> +NETPERF_SITE = http://sources.buildroot.net/netperf
 >> 
 >> We prefer buildroot.org over buildroot.net nowadays, so I changed that.

 > BR2_BACKUP_SITE still defaults to "http://sources.buildroot.net". Should
 > we change that?

There is a fairly important difference between .net and .org, .net is
though the cloudflare cache, but .org goes straight to our upstream
server.

Given the extra bandwidth and availibility of Cloudflare, I would prefer
we use .net.

-- 
Bye, Peter Korsgaard
