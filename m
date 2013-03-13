From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Mar 2013 21:12:06 +0100
Subject: [Buildroot] [PATCH 2 of 3] oprofile: upstep 0.9.7 patches to
 0.9.8
In-Reply-To: <CAAXf6LXwyWv2KfQ3OW=KNYm7SN+y++79puqeN=C+yR50M-f5cw@mail.gmail.com>
References: <patchbomb.1363111853@BEANTN0L019720>
 <41943bd3969a02bce5f9.1363111855@BEANTN0L019720>
 <20130313082420.0ae03777@skate>
 <CAAXf6LXwyWv2KfQ3OW=KNYm7SN+y++79puqeN=C+yR50M-f5cw@mail.gmail.com>
Message-ID: <5140DD96.3040104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/13/13 09:27, Thomas De Schampheleire wrote:
> Hi Thomas,
>
> On Wed, Mar 13, 2013 at 8:24 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Thomas De Schampheleire,
>>
>> On Tue, 12 Mar 2013 19:10:55 +0100, Thomas De Schampheleire wrote:
>>
>>> rename from package/oprofile/oprofile-0.9.7-002-no-query-modules.patch
>>> rename to package/oprofile/oprofile-0.9.8-002-no-query-modules.patch
>>
>> We no longer want the version number in patch file names, for precisely
>> the reason why you're doing this patch in the first place :-)
>
> Are we already making these changes, or are we waiting for someone to
> fix the central patching code according to the new rules first?

  There is nothing to be fixed in the central patching code (at least not 
for this use case). Remove the version number.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
