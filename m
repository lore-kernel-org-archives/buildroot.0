From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Feb 2016 23:09:45 +0100
Subject: [Buildroot] Analysis of build results for 2016-02-21
In-Reply-To: <20160224214249.GO14809@waldemar-brodkorb.de>
References: <20160222073022.D29851025E8@stock.ovh.net>
 <20160222150539.0301105e@free-electrons.com>
 <20160224214249.GO14809@waldemar-brodkorb.de>
Message-ID: <56CE2A29.6080106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/24/16 22:42, Waldemar Brodkorb wrote:
> Hi Thomas,
> Thomas Petazzoni wrote,
> 
>> Hello,
>>
>>>        sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/a17047ada385e5be5f60c07254597fcb7c4183d0/
>>>        sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/6d79591bce2d3fa5b93e268fe50d5b89ecd24521/
>>
>> Could be fixed by http://patchwork.ozlabs.org/patch/569818/, but this
>> patch is wrong I believe now that we have proper Config.in options to
>> describe atomic operation dependencies.
>>
>> Waldemar, could you have a look?
> 
> What about adding a nice chapter to the buildroot manual explaining
> how to handle typical build problems. Subchapters like:
> - PIE and static builds 
> - Atomic build failures

 Great plan! Patches welcome :-)


 Regards,
 Arnout

> 
> come into my mind. 
> 
> Then anybody trying to fix autobuilder problems could step in.
> 
> My personal agenda for buildroot is more like this:
> - fix ARM noMMU internal toolchain 
> - push any required elf2flt changes to new (old) upstream and update
>   br url to fetch it from there
> - add internal bfin toolchain support as soon as gcc 6 is out and
>   integrated
> - resend my coldfire/m68k patch set in a more granular way
> - fix any interesting uClibc-ng compile problems
> ..
> - analyze any interesting sparc/sparc64 autobuilder problems
>   if no other is fixing it :)
> 
> best regards
>  Waldemar
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
