From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Jan 2013 17:55:59 +0100
Subject: [Buildroot] [PATCH 2/7] package/pmake: add host pmake
In-Reply-To: <201301301413.13408.yann.morin.1998@free.fr>
References: <cover.1359498504.git.yann.morin.1998@free.fr>
 <b0d70289993ab5426e1c411b1fc102c7a8022b5d.1359498504.git.yann.morin.1998@free.fr>
 <5108D155.3060208@mind.be> <201301301413.13408.yann.morin.1998@free.fr>
Message-ID: <5109509F.50404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/01/13 14:13, Yann E. MORIN wrote:
> Arnout, All,
>
> On Wednesday 30 January 2013 08:52:53 Arnout Vandecappelle wrote:
>> On 29/01/13 23:33, Yann E. MORIN wrote:
>>> pmake is the make command used by the BSD.
>>> It will used to build BSD-related packages, coming later.
>>>
>>> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
>>> ---
>>>    package/pmake/pmake-100_mk.patch         | 2624 ++++++++++++++++++++++++++++++
>>>    package/pmake/pmake-110_mkdep.patch      |  230 +++
>>>    package/pmake/pmake-120_fixes.patch      |  266 +++
>>>    package/pmake/pmake-130_maxpathlen.patch |   39 +
>>>    package/pmake/pmake-140_multiarch.patch  |  354 ++++
>>>    package/pmake/pmake-150_mktemp.patch     |   31 +
>>
>>    Can't these patches be downloaded with PMAKE_PATCH?
>
> How much I'd like to! But no, the patches are in the -debian.tar.gz
> archive:
>      http://snapshot.debian.org/archive/debian/20120601T033558Z/pool/main/p/pmake/pmake_1.111-3.2.debian.tar.gz
> which contains:
>      $ tar tzf pmake_1.111-3.2.debian.tar.gz |sort
>      debian/
>      debian/changelog
>      debian/compat
>      debian/control
>      debian/copyright
>      debian/patches/
>      debian/patches/100_mk.diff
>      debian/patches/110_mkdep.diff
>      debian/patches/120_fixes.diff
>      debian/patches/130_maxpathlen.diff
>      debian/patches/140_multiarch.diff
>      debian/patches/150_mktemp.diff
>      debian/patches/series
>      debian/rules
>      debian/source/
>      debian/source/format
>
> And the generic infrastructure does not allow to extract an archive to
> get patches from.

  Doesn't it?  It seems to work for liblockfile...

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
