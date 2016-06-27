From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Jun 2016 23:38:27 +0200
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2016-06-19
In-Reply-To: <1467017565.3628.24.camel@synopsys.com>
References: <20160620063029.16331102969@stock.ovh.net>
 <1466742836.3244.20.camel@synopsys.com>
 <20160624091442.6a4f342f@free-electrons.com>
 <1466752647.3244.40.camel@synopsys.com>
 <f4d27bb8-4174-e864-50ff-c5021bf8f711@mind.be>
 <1467017565.3628.24.camel@synopsys.com>
Message-ID: <1ec2ade6-853f-cad0-b03d-e37c14c7b2d8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-06-16 10:53, Alexey Brodkin wrote:
> Hi Arnout,
> 
> On Sat, 2016-06-25 at 00:46 +0200, Arnout Vandecappelle wrote:
>> On 24-06-16 09:18, Alexey Brodkin wrote:
>>>
>>> Hi Thomas,
>>>
>>> On Fri, 2016-06-24 at 09:14 +0200, Thomas Petazzoni wrote:
[snip]
>>> Vlad will send a patch which bump ARC tools to arc-2016.09-eng004 shortly.
>>> Since other components like gcc and gdb are also not fully upstream we'll be
>>> bumping all 3 components at once:
>>>  1. Binutils
>>>  2. Gcc
>>>  3. Gdb
>>  I guess all of these will be updated regularly, right? That means Thomas also
>> has to respin the autobuilder toolchains with every update. If Synopsys anyway
>> produces toolchain binaries already, it could be interesting to add these as
>> external toolchains.
> 
> Good point.
> 
> Actually we didn't plan to put prebuilt tools in the same location as released versions
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases simply to not confuse
> real users (otherwise people may think it's ok to use those engineering builds for production).
> 
> Moreover I remember we discussed that topic of ARC prebuilt tools in Buildroot and conclusion was
> to disable our prebuilt tools from autobuilder tests because our uClibc configuration had some missing
> options if compared to Buildroot.
> 
> As the simplest solution (but probably not the best from performance standpoint) could be
> to disable use of prebuilt tools for ARC before we have something more or less stable.

 That would result in less ARC builds so less build failures. I think Thomas
will probably just respin the toolchains then.

 Regards,
 Arnout

> 
> But let's discuss all options what we have first.
> 
> -Alexey
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
