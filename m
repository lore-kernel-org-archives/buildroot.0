From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 10 Apr 2016 16:59:14 +0200
Subject: [Buildroot] [PATCH v4 1/3] package/radlib: kconfig and makefile
In-Reply-To: <1460046983.3710.12.camel@intel.com>
References: <1459948770-2769-1-git-send-email-ray.kinsella@intel.com>
 <1459948770-2769-2-git-send-email-ray.kinsella@intel.com>
 <57058BC3.1070105@mind.be> <1460027041.3176.5.camel@intel.com>
 <57067BFE.3090207@mind.be> <1460046983.3710.12.camel@intel.com>
Message-ID: <570A6A42.1090703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/07/16 18:36, Kinsella, Ray wrote:
> On Thu, 2016-04-07 at 17:25 +0200, Arnout Vandecappelle wrote:
>>> Confused, just doing what I was asked in the previous review.
>>> Can you offer a little more guidance on how I should structure.
>>
>>    You misunderstood the patches that Thomas was refering to. There
>> should be a
>> single PATCH v5 that you send to the buildroot mailing list, which
>> contains
>> Config.in, radlib.mk, radlib.hash, and at least 3 ....patch files.
>
> ok I get it ... your point about the build being broken between patches
> makes perfect sense.
>
> So a single email PATCH v3 patching radlib.mk, Config.in, radlib.hash
> and three patches. On the 3 patches, can we define what these look
> like...
>
> 1. Patch to introduce pkg-config for sqlite and postgresql.
> 2. Patch to introduce mysql-config.
> 3. Patch to fix the paths in the subdir-objects.
>
> Accurate, make sense?

  Yes, makes sense.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
