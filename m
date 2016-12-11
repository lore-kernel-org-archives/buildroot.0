From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Dec 2016 21:38:42 +0100
Subject: [Buildroot] [PATCH] m68k: add special gcc flag to avoid ICE for
 coldfire
In-Reply-To: <20161211155154.55553108@free-electrons.com>
References: <20161126085144.GA23223@waldemar-brodkorb.de>
 <20161126145224.2aa5ef33@free-electrons.com>
 <c7f2be5d-3849-d30b-bf39-731477bc1927@mind.be>
 <20161211155154.55553108@free-electrons.com>
Message-ID: <023a1d9d-4ff4-5033-8d7b-02832c017b3a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-12-16 15:51, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 26 Nov 2016 14:59:34 +0100, Arnout Vandecappelle wrote:
> 
>>  Begging to differ: doing the same without patch 683830 would be a much bigger
>> patch (adding yet another -D option to the wrapper, updating the wrapper
>> itself). But OK, it's getting a bit later to still take _any_ risk, so probably
>> the bigger patch is better.
> 
> Have you had the chance to work on your toolchain wrapper patches, at
> least enough to be able to merge this m68k change?

 Not yet, and it doesn't look like I'll have much time this year...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
