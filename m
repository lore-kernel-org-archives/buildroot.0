From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Apr 2021 22:41:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/avahi: allow disabling default
 services
In-Reply-To: <20210415194721.GG359705@scaer>
References: <101e-60780880-3-3d17a340@6714720>
 <64232bf4-4811-35ef-f9fa-d44f662a003a@mind.be>
 <20210415194721.GG359705@scaer>
Message-ID: <05615764-3ea6-fefe-eb5d-711c8e21e1d7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/04/2021 21:47, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2021-04-15 21:02 +0200, Arnout Vandecappelle spake thusly:
[snip]
>> e.g. UPGRADING, that makes explicit note of such changes. Some time ago, I tried
>> to keep something like that going by editing CHANGES, but it didn't amount to
>> much, and that file is so full that it's hard to find the relevant bits.
> 
> This is going to bit-rot eventually... :-/

 It's similar to Config.in.legacy, for all the things that can't be expressed in
Kconfig. So how is it going to bitrot?

 It could also be put in the manual directly, but I actually think it's harder
to find there.


> 
>>  I've added a bunch of random people in Cc whom I think might have a relevant
>> opinion about this. I hope nobody will feel offended because I didn't include
>> them :-)
>>
>>  If this idea gains traction, I volunteer to write a skeleton UPGRADING file,
>> and refer to it from the manual. I've been thinking for a long time already that
>> I really should add a section to the manual about what to do when you upgrade
>> Buildroot, and this would be the ideal push for me.
> 
> What about the existing section, then:
>     https://buildroot.org/downloads/manual/manual.html#migrating-from-ol-versions

 Heh, I searched for variations of upgrade and update, not for migrate :-)

 Goes to show that it's not very discoverable!


 Regards,
 Arnout


> 
> (notice the typo in the anchor, giving away who wrote it ;-] And even
> then, that typo is still fitting my ol' little me... ;-] )
> 
> Regards,
> Yann E. MORIN.
> 
