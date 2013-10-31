From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Oct 2013 11:17:22 +0100
Subject: [Buildroot] [PATCH] arch/mips: Set BR2_GCC_TARGET_ARCH for MIPS
In-Reply-To: <CAAXf6LVZW++12ECLBa0MoHUdjFKXdYy0ueoSk4a6WpvxYuAyJA@mail.gmail.com>
References: <1382970069-16449-1-git-send-email-markos.chandras@imgtec.com>
 <20131030184534.7bf2477b@skate>
 <CAAXf6LVCOqiCdQfy+S_YRiA2c1fzGpip36=hM4c6M+cV=S47og@mail.gmail.com>
 <20131031102253.1aeaea28@skate>
 <CAAXf6LVZW++12ECLBa0MoHUdjFKXdYy0ueoSk4a6WpvxYuAyJA@mail.gmail.com>
Message-ID: <52722E32.7050307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/10/13 11:13, Thomas De Schampheleire wrote:
> On Thu, Oct 31, 2013 at 10:22 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Thomas De Schampheleire,
>>
>> On Thu, 31 Oct 2013 10:19:01 +0100, Thomas De Schampheleire wrote:
>>
>>>> Applied to for-peter-2013.11, a branch that I will ask Peter to pull
>>>> when he comes back. I will mark such patches as Accepted in patchwork,
>>>> making the (maybe optimistic) assumption that Peter will pull my entire
>>>> branch.
>>>
>>> Why not use the 'Delegated to' field in patchwork instead? It will
>>> keep the patch as New, until being applied, and it is clear whose
>>> branch it is in.
>>
>> Could be a possibility indeed, but it means that I continue to see
>> these patches in patchwork. Admittedly with a different state, but it's
>> not as nice as not having them anymore.

  I would set it as Superseded, instead of Accepted. The assumption is 
that you'll repost the series on the list, not send an empty pull 
request, right? Then Superseded is actually the correct state, or 
eventually it will be.

>
> It would be great if we could add extra states to the patchwork
> configuration. I looked at the patchwork sources, which has an xml
> file with the different states, but it was unclear to me where this
> file is read, and whether it is project specific or patchwork-global.
>
> Do note that it is possible to change the search filter, and specify
> 'Nobody' in the Delegate field. Since the search is HTTP/GET based,
> you can add this URL as a bookmark.
> http://patchwork.ozlabs.org/project/buildroot/list/?delegate=-
>
>>
>> I've been quite conservative on the patches I've taken (i.e no new
>> packages or version bumps), so I'm pretty confident that Peter should
>> take all of them.
>
> I have no doubt on your good judgement here. I'm only considering what
> will happen if several people start acting as a maintainer-proxy. In
> patchwork, it will not be visible at all who has taken a given patch.

  So it should both be delegated to and state superseded...

> Suppose that for some reason the maintainer-proxy forgets about the
> patch, then it will be lost unless the submitter notices it and pings.

  That seems to me like a very exceptional situation.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
