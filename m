From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 May 2017 11:25:53 +0200
Subject: [Buildroot] [PATCHv5] mpir: fix build failure
In-Reply-To: <20170501112149.46c43ad1@free-electrons.com>
References: <mpir: fix build failure>
 <1492774031-25802-1-git-send-email-semenak94@mail.ru>
 <20170501112149.46c43ad1@free-electrons.com>
Message-ID: <20170501112553.4429df6d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 1 May 2017 11:21:49 +0200, Thomas Petazzoni wrote:

>  * On ARM, we fail with the old Crosstool-NG toolchains, but apparently
>    not with other ARM toolchains. Both the ARMv5 and ARMv7 Crosstool-NG
>    toolchains are failing to build MPIR:
> 
>    http://autobuild.buildroot.net/results/fd0/fd032f7dbd4cace84bb31e8017cb6139ef3c1072/build-end.log
>    http://autobuild.buildroot.net/results/c36/c360581c2925529f18635aac32c2865899f5e0f5/build-end.log
> 
>  * On MIPS64r6
> 
>    http://autobuild.buildroot.net/results/c45/c45dd59f10693b0d9a86dac4733c6c3dde4554f1/build-end.log
> 
>  * On PowerPC64
> 
>    http://autobuild.buildroot.net/results/be1/be1478836b2e7b580174641f48de92c9b02512a7/build-end.log
> 
> Could you have a look and fix those remaining issues?

And by the way: please use the test-pkg script in
support/scripts/test-pkg to test that MPIR builds correctly on all
platforms.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
