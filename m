From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 6 Mar 2017 22:01:36 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2017-03-05 - qt5base-5.8.0
In-Reply-To: <20170306072843.F3B9620B87@mail.free-electrons.com>
References: <20170306072843.F3B9620B87@mail.free-electrons.com>
Message-ID: <20170306220136.3f171b40@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  6 Mar 2017 08:28:43 +0100 (CET), Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2017-03-05, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Build failures related to your packages:
> 
>          arm |                  qt5base-5.8.0 | http://autobuild.buildroot.net/results/29aa34c4e3b10739a13db6d86b3f0691668480e9
> 

/home/dawncrow/buildroot-test/scripts/instance-0/output/host/opt/ext-toolchain/armv7-ctng-linux-gnueabihf/include/c++/4.8.3/bits/atomic_base.h:577:70: error: failure memory model cannot be stronger than success memory model for '__atomic_compare_exchange'
  return __atomic_compare_exchange_n(&_M_i, &__i1, __i2, 0, __m1, __m2);


There exists a proposed patch ([1] link to attached patch at bottom of page) or
proposed workaround to upgrade from gcc-4.8 to gcc-4.9 ([2])...

Regards,
Peter

[1] http://lists.qt-project.org/pipermail/development/2016-May/025992.html
[2] http://lists.qt-project.org/pipermail/development/2016-May/026001.html
