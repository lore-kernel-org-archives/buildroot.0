From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 7 Dec 2018 14:51:10 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-11-30
In-Reply-To: <20181201070056.2081320CFD@mail.bootlin.com>
References: <20181201070056.2081320CFD@mail.bootlin.com>
Message-ID: <CANQCQpaywbUO_6CrLYvBSZBO_cfneisDrWkx6joX7pDiHfvA-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ellie,

On Sat, Dec 1, 2018 at 1:01 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
[snip]

>
>       x86_64 | kvm-unit-tests-kvm-unit-tes... | http://autobuild.buildroot.net/results/a2aabacbb97eb6b9610b41b8318385f1164e8bfe
>

I'm working on a configure check to fix this failure on Arch Linux and
was planning to reuse the way the kernel is doing the test. I don't
currently have a machine where this test would fail.   Would you mind
running the [1] script  (I'm assuming your system is 64bit) on your
autobuilder machine?

[2] is an example where the kernel uses that script to test for success.

Thanks
Matt


[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/gcc-x86_64-has-stack-protector.sh?h=v4.20-rc5
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/Kconfig?h=v4.20-rc5#n357
