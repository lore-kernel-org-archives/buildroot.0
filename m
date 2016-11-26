From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Nov 2016 14:59:34 +0100
Subject: [Buildroot] [PATCH] m68k: add special gcc flag to avoid ICE for
 coldfire
In-Reply-To: <20161126145224.2aa5ef33@free-electrons.com>
References: <20161126085144.GA23223@waldemar-brodkorb.de>
 <20161126145224.2aa5ef33@free-electrons.com>
Message-ID: <c7f2be5d-3849-d30b-bf39-731477bc1927@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-11-16 14:52, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 26 Nov 2016 09:51:44 +0100, Waldemar Brodkorb wrote:
>> Fixes:
>>   http://autobuild.buildroot.net/results/d47fa41aa860d82471b83ac90967d3a3dacd8611
>>   http://autobuild.buildroot.net/results/a21de4747f40a5ce93108c8979fbc0277d040e79
>>
>> Requires this as prerequisite:
>> http://patchwork.ozlabs.org/patch/683830/
> 
> Hum, thanks but this patch you're pointing to is really material for
> next at this point, so I cannot apply your patch, which should be
> applied on master in order to fix the autobuilder issues.

 Begging to differ: doing the same without patch 683830 would be a much bigger
patch (adding yet another -D option to the wrapper, updating the wrapper
itself). But OK, it's getting a bit later to still take _any_ risk, so probably
the bigger patch is better.

 Regards,
 Arnout

> 
> Thanks,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
