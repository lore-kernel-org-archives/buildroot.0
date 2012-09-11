From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 11 Sep 2012 19:27:48 +0200
Subject: [Buildroot] disabling parallel make for a generic package
In-Reply-To: <CAE9DZUThTZYAbwUhhDOct5wDA3BGh48z3Yvv0cK8_ZvAoJBp_Q@mail.gmail.com>
References: <CAE9DZUThTZYAbwUhhDOct5wDA3BGh48z3Yvv0cK8_ZvAoJBp_Q@mail.gmail.com>
Message-ID: <CAHXCMMLdX9yzcxLPkCEgu8Qjw8O41D88dON2F41BgLvpZ1t4yg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dallas,

2012/9/11 Dallas Clement <dallas.a.clement@gmail.com>:
> Hello All,
>
> I need to turn off parallel make for one particular generic package.
> I see that this can be done for an auto-tools package by doing the
> following:
>
> LIBFOO_MAKE=$(MAKE1)
>
> This doesn't seem to work for my generic package though.  Is there a
> different way to do this for generic packages?
For generic packages, this is as simple as calling $(MAKE1) instead of $(MAKE)
(as example, see: http://git.buildroot.net/buildroot/tree/package/feh/feh.mk)


Cheers,

-- 
Sam
