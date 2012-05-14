From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Sun, 13 May 2012 23:54:09 -0400
Subject: [Buildroot] Fwd: [PATCH] Added package v86d which provides a
 real-mode helper for uvesafb driver.
In-Reply-To: <CADiAo4KYq_xVcstt8LTK5PtgdyVHfLguqq9Jfpi13aSC7FnATg@mail.gmail.com>
References: <1336560101-29035-1-git-send-email-golubovsky@gmail.com>
 <4FAD9523.3020501@mind.be>
 <CADiAo4KofjL+kb8RLbWRwHauYpgqtWefLi_4QwV50sMgf-M+VA@mail.gmail.com>
 <4FAE741C.7090104@mind.be>
 <CADiAo4KYq_xVcstt8LTK5PtgdyVHfLguqq9Jfpi13aSC7FnATg@mail.gmail.com>
Message-ID: <CADiAo4+zciWdAz-h8DwbrbYrmxiBoRuyYbC0QUSA-8-hHwHMyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forgot to copy the list.


---------- Forwarded message ----------
From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Sun, May 13, 2012 at 11:52 PM
Subject: Re: [Buildroot] [PATCH] Added package v86d which provides a
real-mode helper for uvesafb driver.
To: Arnout Vandecappelle <arnout@mind.be>


Arnout,

On Sat, May 12, 2012 at 10:30 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> ?I tried it with a clean build and there's no v86d or testvbe in the target
> dir.

Indeed, my omission. Thanks for pointing me out.

>>> But you don't even need to override the BUILD_CMDS. ?Instead, you can
>>> pass additional options to the MAKE call, by defining
>>>
>>> V86D_MAKE_OPT += CC="$(TARGET_CC) -D__i386__"

> ?Sure, it's OK as it is (except for the install target of course).
> Merely pointing out an alternative.

Thanks, but I'll stay with what I have.

I am resending the patch - hopefully it is good t go now.

--
Dmitry Golubovsky

Anywhere on the Web


-- 
Dmitry Golubovsky

Anywhere on the Web
