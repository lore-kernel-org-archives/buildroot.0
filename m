From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 16 Sep 2015 22:46:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/ruby: disable use of stack
 protector when not available
In-Reply-To: <20150916234321.7d49a220@free-electrons.com>
References: <1442347019-28368-1-git-send-email-brendanheading@gmail.com>
 <20150916224451.45bbe561@free-electrons.com>
 <CA+BsyQ4dFvFDR_e_vQ++8LoH9DfR9w2urypZ17795mEd5ZH2yA@mail.gmail.com>
 <20150916234321.7d49a220@free-electrons.com>
Message-ID: <CA+BsyQ7Hr2XLUo5zFb=XOd062NMsU-K7mXS68kV3z-irEfvUxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Thanks for the update. However, notice that the toolchain at
> http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.08-rc1-38-gad0f85e.tar.bz2
> is capable of building sudo and ruby, even if:
>
>  1/ It is using uClibc-ng 1.0.5
>  2/ It has SSP disabled: #undef __UCLIBC_HAS_SSP__
>
> So it's not simply a matter of uClibc vs. uClibc-ng, since one
> uClibc-ng toolchains works fine.

Thomas,

thanks for the tip - I will find out why that scenario seems to work,
after I've identified the failure mode of the one I'm looking at now.

Brendan
