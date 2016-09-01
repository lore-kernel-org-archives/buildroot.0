From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Sep 2016 23:43:56 +0200
Subject: [Buildroot] [PATCH 00/16 v3] br2-external: support multiple
 trees at once (branch yem/multi-br2-external-ID-7)
In-Reply-To: <20160831092643.GA5549@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <eda2b290-992f-7a26-424b-f522b7a805ae@mind.be>
 <874m611n1e.fsf@dell.be.48ers.dk>
 <20160831091443.691ffd1c@free-electrons.com> <20160831092643.GA5549@free.fr>
Message-ID: <e47d26b6-26a6-ac0a-8334-b9a0785084f4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-08-16 11:26, Yann E. MORIN wrote:
> Thomas, Arnout,All,
> 
> On 2016-08-31 09:14 +0200, Thomas Petazzoni spake thusly:
>> On Wed, 31 Aug 2016 08:15:57 +0200, Peter Korsgaard wrote:
>>
>>>  >  Supporting the old single-external without name in parallel with the new named
>>>  > approach takes a significant amount of code - I estimate about 40 lines, out of
>>>  > 285 lines affected by this patch set...  
>>>
>>>  >  So, I repeat: I think the backward compatibility should be dropped here.  
>>>
>>> That also sounds sensible to me.
>>
>> I originally insisted to keep the backward compatibility, but Arnout's
>> argumentation convinced me that it is not really necessary. And if it
>> can help reduce the implementation complexity, I'm all for it.
>>
>> So: I'm fine with dropping backward compatibility on this.
> 
> OK, I'll drop.

 One remark though: we should really document such backward compatibility
issues. I don't think we're currently doing that well.

 Where should this be done?

- In CHANGES? At the moment, however, the CHANGES file is not really inviting to
look for that kind of thing. Especially because users will often upgrade in
jumps of 4 or more releases - that makes up 900 lines of CHANGES text...

- In the manual? There isn't really an appropriate place for it at the moment.
And how long do we keep it there?

- In some new location? Where?


 My personal preference would be in the manual, and keep it for a couple of years.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
