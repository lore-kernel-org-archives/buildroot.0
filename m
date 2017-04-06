From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 6 Apr 2017 10:42:38 +0200
Subject: [Buildroot] [PATCH v2] arp-scan: new package
In-Reply-To: <20170406103300.04ef2b35@free-electrons.com>
References: <20170405101410.27980-1-arnout@mind.be>
 <20170405183445.6cde0af8@free-electrons.com>
 <857569ae-aa99-8ae8-17c6-14d0f98afbc5@mind.be>
 <20170406103300.04ef2b35@free-electrons.com>
Message-ID: <41bc6852-4d23-5911-2722-3ed256004fb0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-04-17 10:33, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 6 Apr 2017 10:26:58 +0200, Arnout Vandecappelle wrote:
> 
>>  Since it was caused by the bump of binutils, you should probably look at the
>> binutils repo, not the elf2flt repo...
> 
> That was not my reasoning. My reasoning was that the new binutils
> version does not have a bug, but generates a binary that is slightly
> different than previous binutils version, and elf2flt does not handle
> that correctly.
> 
> Of course, that's complete guess, but binutils is IMO a much better
> maintained set of tools than elf2flt, so I would first and foremost
> suspect a bug in elf2flt.

 Of course, but it would be a bug that is triggered by a change in binutils.
Looking at the commits in elf2flt is not going to help. And reading elf2flt.c is
a challenge, I would say...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
