From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Sun, 5 Aug 2012 20:56:45 +0200
Subject: [Buildroot] [PATCH 1/2] Added packages libmsgpack (v. 0.5.7)
 without C++ support (as in small embedded systems buildroot is often
 compiled without C++ support) and msgpack-python version 0.1.10 (which does
 not rely yet on python-setuptools. I had
In-Reply-To: <CAHXCMMLZtrdpGPV5ivdc9cOiJydYCVRZ=8dGi0_P9pbrHNuwXQ@mail.gmail.com>
References: <CAHXCMMLZtrdpGPV5ivdc9cOiJydYCVRZ=8dGi0_P9pbrHNuwXQ@mail.gmail.com>
Message-ID: <CAMduVEe-hduc5vkCpEmoRb8cOGHopw6p7MQyg=KTqfUky94Cow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 5, 2012 at 4:56 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>
> Thanks for your patch series.
>
> First, some remarks when posting patch(es) for new packages:
> - 1 package per patch (and 1 patch per package).
>   If you need to rework your commits before posting them, you
> certainly want to rebase your branch using 'git rebase'
>   (some tips are gathered at: http://elinux.org/Buildroot_how_to_contribute )
> - take care of the commit message:
>   the 1st line should be "<package name>: new package", then if you
> want to give some details, you can add them with 1 blank line between
> the 1st line and these details.
>
> Hereafter, my comments inlined.

Dear Sam,

Thank's a lot for your remarks. I'll do my best to obey to those rules
in my next posts.
However in the meantime (before I've read your mail) I have posted yet
another patch not conforming to those rules.
This one adds implementation of msgpack for Lua.
Sorry for confusion,
Regards,

Wojtek
