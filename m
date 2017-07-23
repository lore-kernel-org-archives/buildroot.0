From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Jul 2017 22:32:24 +0200
Subject: [Buildroot] [PATCH 12/20] package/skeleton: split out into
 skeleton-common
In-Reply-To: <20170723094855.GB26998@scaer>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <af100c0e2b252ccec7e9e2b8ebc88964c78bb4dc.1500398733.git.yann.morin.1998@free.fr>
 <6bcf485a-e334-33d6-4fb1-17553670d2fb@mind.be> <20170723094855.GB26998@scaer>
Message-ID: <93d18b26-049a-6172-9804-a655fc1bd32e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 First of all: I agree/accept all the feedback you gave to my review comments.

On 23-07-17 11:48, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2017-07-23 01:06 +0200, Arnout Vandecappelle spake thusly:
[snip]
>>> +SKELETON_COMMON_PATH = system/skeleton
>>
>>  Not for this patch of course, but I think it would make sense to also move that
>> here. But you probably thought of that already :-)
> 
> Yes, that's is what I did in the first iteration, but Thomas was against
> moving it, so I left it alone to stay there.

 Thomas, do you remember why you were against moving the skeleton to
package/skeleton-common?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
