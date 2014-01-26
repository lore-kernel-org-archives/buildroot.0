From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 26 Jan 2014 21:35:26 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-01-23
In-Reply-To: <87vbx9ajnh.fsf@dell.be.48ers.dk>
References: <20140124073009.DF0461010C8@stock.ovh.net>
 <87vbx9ajnh.fsf@dell.be.48ers.dk>
Message-ID: <CAHXCMMLCsuLQZNKdvQ=VcC2_wLm67mF2gWDqRF21HCzq6F1dHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

2014-01-24 Peter Korsgaard <jacmet@uclibc.org>

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> writes:
>
>  > Detail of failures
>  > ===================
>
>  >    powerpc |                    gtest-1.7.0 | NOK |
> http://autobuild.buildroot.net/results/5c6e58c51b2a14a7f23d296f771a76096b80362a/
>  >       i686 |                    gtest-1.7.0 | NOK |
> http://autobuild.buildroot.net/results/bde777d343e9c4884272893d0da3b113dcc75e3a/
>  >        arm |                    gtest-1.7.0 | NOK |
> http://autobuild.buildroot.net/results/20cbf90749672607cb277c676a45d2c0c3965fa0/
>  >     x86_64 |                    gtest-1.7.0 | NOK |
> http://autobuild.buildroot.net/results/1e610142e72676bd8d13aa8e87829b492c714257/
>  >       i686 |                    gtest-1.7.0 | NOK |
> http://autobuild.buildroot.net/results/e5b54b716fb2371014b4f7ac79287bea6d4b03de/
>  >       i686 |                    gtest-1.7.0 | NOK |
> http://autobuild.buildroot.net/results/b1e9bae22b3e0b91dccfd034864c4a5c7848f41c/
>  >   mips64el |                    gtest-1.7.0 | NOK |
> http://autobuild.buildroot.net/results/89a29d1f597dbc12a6fc8eb079133a84952fc612/
>  >     mipsel |                    gtest-1.7.0 | NOK |
> http://autobuild.buildroot.net/results/9f891b201e4e9db4a67868ecadb46bd8e95e9d41/
>  >     x86_64 |                    gtest-1.7.0 | NOK |
> http://autobuild.buildroot.net/results/ce02a951d5751a35b7669d46deec0534e7ddf427/
>
> It looks like these are likely to be caused by the cmake infrastructure
> change. Samuel, care to take a look?
>
Of course. :)
Here is the fix: http://patchwork.ozlabs.org/patch/313929/

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140126/9acff8a4/attachment.html>
