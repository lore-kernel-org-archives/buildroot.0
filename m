From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Nov 2016 00:36:13 +0100
Subject: [Buildroot] [PATCH/next] toolchain-external: support gcc < 4.3
In-Reply-To: <20161123231938.1eda5882@free-electrons.com>
References: <20161123111404.20661-1-arnout@mind.be>
 <20161123132259.47f9a228@free-electrons.com>
 <bad536b8-2eac-6ea8-f7b7-8297a5c01b85@mind.be>
 <20161123231938.1eda5882@free-electrons.com>
Message-ID: <5b33208f-473e-f890-7ce2-1d3ba6599fb4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-11-16 23:19, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 23 Nov 2016 13:27:38 +0100, Arnout Vandecappelle wrote:
> 
>>> The Blackfin ADI toolchains use gcc 4.3, if I remember correctly.  
>>
>>  Sorry, let me correct my statement: because they are currently unused by any
>> package and will very soon be untested in the autobuilders.
> 
> Huh?
> 
> toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in:     select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
> 
> So it's definitely used, at least until we remove the ADI Blackfin
> toolchain.

 When I say package, I mean: no package depends on _AT_LEAST_4_3 or _4_4.

 And the ADI Blackfin removal patch is coming up :-)

 Regards,
 Arnout

> 
> Bets regards,
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
