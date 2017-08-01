From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Tue, 1 Aug 2017 22:04:07 +0530
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-07-30
In-Reply-To: <20170731063108.12B5521DFC@mail.free-electrons.com>
References: <20170731063108.12B5521DFC@mail.free-electrons.com>
Message-ID: <CA+NV+VnF02-_eYGDycSH-EMJVZyNkjwj74dSAmxpSjLG2fobdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Jul 31, 2017 at 12:01 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2017-07-30, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Build failures related to your packages:
>
>       x86_64 |           let-me-create-v1.5.2 | http://autobuild.buildroot.net/results/af946fa6fe05ee265e4ac97742b15afeb0cea1ab

I am trying to reproduce this issue but I get following build failure
while setting up toolchain.

>>> toolchain-external-custom  Configuring
Incorrect selection of kernel headers: expected 2.6.x, got 4.12.x
package/pkg-generic.mk:217: recipe for target
'/home/rahul/upstream/buildroot/letmefail/build/toolchain-external-custom/.stamp_configured'
failed
make[1]: *** [/home/rahul/upstream/buildroot/letmefail/build/toolchain-external-custom/.stamp_configured]
Error 1
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2

Could you help me with this ?

Thanks,
Rahul
