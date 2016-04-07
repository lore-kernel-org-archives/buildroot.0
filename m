From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Apr 2016 17:25:50 +0200
Subject: [Buildroot] [PATCH v4 1/3] package/radlib: kconfig and makefile
In-Reply-To: <1460027041.3176.5.camel@intel.com>
References: <1459948770-2769-1-git-send-email-ray.kinsella@intel.com>
 <1459948770-2769-2-git-send-email-ray.kinsella@intel.com>
 <57058BC3.1070105@mind.be> <1460027041.3176.5.camel@intel.com>
Message-ID: <57067BFE.3090207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/07/16 13:04, Kinsella, Ray wrote:
> Hi Arnout,
>
> On Thu, 2016-04-07 at 00:20 +0200, Arnout Vandecappelle wrote:
>>    Very quick feedback, not a detailed review.
>>
>>    First of all, the three patches should be squashed into one,
>> because all three
>> are needed to have a functional package. Otherwise, the build would
>> be broken
>> between the patches.
>>
>
> Confused, just doing what I was asked in the previous review.
> Can you offer a little more guidance on how I should structure.

  You misunderstood the patches that Thomas was refering to. There should be a 
single PATCH v5 that you send to the buildroot mailing list, which contains 
Config.in, radlib.mk, radlib.hash, and at least 3 ....patch files.

  Regards,
  Arnout

>
> Agree that you need all the pieces for a functional package.
>
> On Tue, 2016-03-29 at 20:07 +0200, Thomas Petazzoni wrote:
>> Hello,
>> So you're doing three different things. Which calls for three
>> different
>> patches.
>>
>> I'll do a full review once you send it with git send-email, because
>> the
>> line wrapping makes it really hard to follow.
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
