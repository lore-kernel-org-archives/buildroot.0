From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 10 Jun 2017 11:38:54 +0200
Subject: [Buildroot] [PATCH v3 04/11] package/python-ipython-genutils:
	New package
In-Reply-To: <2b491e00-2db9-0663-f3f3-19f304301945@mind.be>
References: <20170602235653.4655-1-andrew.smirnov@gmail.com>
 <20170602235653.4655-5-andrew.smirnov@gmail.com>
 <CAGm1_ksYttP0j8VPYitGR5JB+AAVsmx2ovf_T1tNkuQgxnV2Ag@mail.gmail.com>
 <2b491e00-2db9-0663-f3f3-19f304301945@mind.be>
Message-ID: <CAGm1_kvXRPMZGsz5J1GBbhZSGnS8P_oriFd2YGDCZW4ijZiw6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sat, Jun 10, 2017 at 11:03 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Hi Yegor,
>
> On 09-06-17 21:03, Yegor Yefremov wrote:
>>> +PYTHON_IPYTHON_GENUTILS_LICENSE = BSD-3-Clause
>>
>> Licence should be BSD-4-Clause and tarball contains COPYING.md, so
>> PYTHON_IPYTHON_GENUTILS_LICENSE_FILES should be also added.
>>
>> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
>
>  This tag means: I reviewed the patch and it is according to me ready to be
> accepted. So if you have comments on the patch, you would typically *NOT* add
> your Reviewed-by tag. You may say something like:
>
> With these issues fixed:
>   Reviewed-by: ...

You're right. It was my intent.

Yegor

>
> (with whitespace in front).
>
>  The reason for this is that the Reviewed-by tag gets picked up by Patchwork,
> and Peter and Thomas look at the R tag in patchwork to decide to apply a series.
> They *should* see that in fact there were some comments and update the patch
> before committing, but it's a bit of a risk. Putting spaces in front stops
> Patchwork from picking up the tag.
>
>  If the comments are minor (i.e. the patch is still correct, there is no harm in
> committing it as-is), it's just some spelling errors or bikeshedding) then you
> could still add the Rev-by tag. But in this case, since the license is wrong,
> it's NOT OK to commit as-is.
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
