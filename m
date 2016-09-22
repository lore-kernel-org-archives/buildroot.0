From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Sep 2016 11:42:13 +0200
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: new package
In-Reply-To: <20160922113438.452fefd0@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 22 Sep 2016 11:34:38 +0200")
References: <20160817230236.8255-1-cyrilbur@gmail.com>
 <20160921092449.32147532@free-electrons.com>
 <1474502510.2194.0.camel@gmail.com> <877fa4qzqd.fsf@dell.be.48ers.dk>
 <20160922113438.452fefd0@free-electrons.com>
Message-ID: <87ponwp8y2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Some of the issues are that it expects the x86-64 toolchain to support
 >> -m32 for bootstrap code (which our cross compilers normally don't), so
 >> we need the same workaround as we do for syslinux and grub to build
 >> those with the host compiler.

 > I guess this explains the build failure on x86-64, but not the ones on
 > arm and i686.

Indeed - That's why I wrote 'some' ;)

-- 
Venlig hilsen,
Peter Korsgaard 
