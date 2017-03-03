From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 4 Mar 2017 00:43:20 +0100
Subject: [Buildroot] [PATCH] linux: Add CIP SLTS easy selection option
In-Reply-To: <20170304000243.35b8b146@free-electrons.com>
References: <1488577816-19047-1-git-send-email-angelo.compagnucci@gmail.com>
 <20170303234636.0dbf4fd6@free-electrons.com>
 <7663394e-1ac6-07ae-a226-159605ac4011@mind.be>
 <20170304000243.35b8b146@free-electrons.com>
Message-ID: <ecfd4a44-a1b8-19c9-f6c0-ba7998be2c85@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-03-17 00:02, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 3 Mar 2017 23:50:54 +0100, Arnout Vandecappelle wrote:
> 
>>  In addition, I have yet to meet an actual embedded system product that uses an
>> unpatched kernel. In practice, the CIP kernel is going to be the _base_ of a
>> product, and not used directly.
>>
>>  That said, it would be useful to add a defconfig that makes use of that kernel.
> 
> I don't really see how that would be useful. What would it bring
> exactly?

 Advertising that this repository exists and show how it can be used with
Buildroot. The latter part is of course trivial for us but still useful for
newcomers I think.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
