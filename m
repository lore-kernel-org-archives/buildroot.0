From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Apr 2017 23:11:49 +0200
Subject: [Buildroot] [PATCH 2/2] binutils: add patch for 2.27 that fixes
 elf2flt segfaults
In-Reply-To: <20170413171857.GA11446@waldemar-brodkorb.de>
References: <20170410084238.13201-1-arnout@mind.be>
 <20170410084238.13201-2-arnout@mind.be>
 <20170413093643.05ffb764@free-electrons.com>
 <579cec15-214a-978c-85ca-1f471f104deb@mind.be>
 <20170413171857.GA11446@waldemar-brodkorb.de>
Message-ID: <200108e5-c259-6403-1a62-a4dc158fb2cb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-04-17 19:18, Waldemar Brodkorb wrote:
> Hi,
> Arnout Vandecappelle wrote,
> 
>>
>>
>> On 13-04-17 09:36, Thomas Petazzoni wrote:
[snip]
>>> Do we know if it is safe to
>>> backport it on 2.27 without other patches?
>>
>>  Nope :-)
>>
>>> Isn't there a more minimal fix for binutils 2.27?
>>
>>  Possibly. Is someone here somewhat familiar with elf2flt? Waldemar?
> 
> No Sorry. Either you might ask on the mailinglist (uclinux) or we
> could just skip 2.27 and move on..

 That's perhaps indeed the best thing to do: disallow binutils 2.27 for Cortex-M.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
