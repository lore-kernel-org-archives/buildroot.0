From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 5 Dec 2013 15:53:50 +0100
Subject: [Buildroot] [PATCH 2 of 2] infra: remove usage of pkgparentdir
 in favor of pkgdir
In-Reply-To: <5282302C.7000005@mind.be>
References: <patchbomb.1384170790@argentina>
 <8953db252a5816d2e988.1384170792@argentina>
 <52816529.9010704@mind.be>
 <CAAXf6LVMJ-EQemvYkvujm+zypQO_cufQq5=z7zz_tto2hug=Aw@mail.gmail.com>
 <20131112120904.4e65d13f@skate>
 <CAAXf6LX+_CGzfYwsAsLMQbUCYoO6Khvh7dcxkDRRt1BespkPGw@mail.gmail.com>
 <5282302C.7000005@mind.be>
Message-ID: <CAAXf6LU6gjv-nH9r+az0gA1Ai=2BhEs1wf27f0-s63Sx403GAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Nov 12, 2013 at 2:42 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
[..]
>>
>>>
>>>   <foo>_BUILDDIR => points to the package build directory in $(BUILD_DIR)
>>>
>>>   <foo>_SRCDIR => points to the package source directory (currently
>>>                   identical to <foo>_BUILDDIR, would change when we
>>>                   introduce OOT build for packages). Actually, more than
>>>                   half of the patch set I have to introduce OOT is about
>>>                   using <foo>_SRCDIR vs <foo>_BUILDDIR in the right
>>>                   places.
>>>
>>>   <foo>_DL_DIR => same as before.
>>
>>
>> In general, I think the new variable names make sense.
>
>
>  +1.
>
>  ThomasP, perhaps you can resubmit the patches for <foo>_SRCDIR vs
> <foo>_BUILDDIR, since they can be applied independently of OOT.
>

Thomas, could you resubmit or point me to these patches? Is it work in
progress or pretty much ready?

I'm going to take up this patch series during this release cycle...

Thanks,
Thomas
