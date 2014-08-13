From: Nathaniel Roach <nroach44@gmail.com>
Date: Wed, 13 Aug 2014 16:26:08 +0800
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140813101514.384e1435@free-electrons.com>
References: <20140813063010.CD21010118A@stock.ovh.net>
 <20140813101514.384e1435@free-electrons.com>
Message-ID: <53EB2120.1050400@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/08/14 16:15, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 13 Aug 2014 08:30:10 +0200 (CEST), Thomas Petazzoni wrote:
> 
>>        arm |     bandwidthd-v2.0.1-auto-r07 | NOK | http://autobuild.buildroot.net/results/024fadb7a8983c0ed35e8a098cfefccd25b3ecd0/
>>        arm |     bandwidthd-v2.0.1-auto-r07 | NOK | http://autobuild.buildroot.net/results/b84759b4b2b4473386fb209b6b4d4e18e203ec17/
>>        arm |     bandwidthd-v2.0.1-auto-r07 | NOK | http://autobuild.buildroot.net/results/e287acf032330c7b0ef4262e7eb365ca45382221/
>>        arm |     bandwidthd-v2.0.1-auto-r07 | NOK | http://autobuild.buildroot.net/results/4ae2406feb33eb81b45bcf87c74f62290bbe00fe/
> 
> Nathaniel, you're the one who contributed bandwidthd. Can you look at
> the above build issues?

I cannot reproduce these errors - I've used the config in the first
build that failed in this way. From what I can see it's failing to pick
up libpng, which is listed as a dependency both directly and indirectly
through libgd. I can try and screw around with the configure script, but
I would need to be able to reproduce it first.

> 
> Thanks,
> 
> Thomas
> 
