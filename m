From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jun 2015 21:28:02 +0200
Subject: [Buildroot] [git commit] gcc: switch to gcc 4.9 as the default
	version
In-Reply-To: <20150623180202.34e83978@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 23 Jun 2015 18:02:02 +0200")
References: <20150622222746.025B07FAFF@busybox.osuosl.org>
 <55890EC2.2040505@mind.be>
 <20150623180202.34e83978@free-electrons.com>
Message-ID: <87egl25inx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > These are always using the default gcc version. However, it is true
 > that all the other Buildroot toolchain configuration use pre-built
 > external toolchains, that are stuck to whatever was the default back
 > when 2015.05, except the following toolchains that already use gcc 4.9:

 > br-aarch64-glibc.config:BR2_GCC_VERSION_4_9_X=y
 > br-arm-cortex-a9-glibc.config:BR2_GCC_VERSION_4_9_X=y
 > br-arm-cortex-a9-musl.config:BR2_GCC_VERSION_4_9_X=y

 > But I can certainly trigger a rebuild of the toolchains with the most
 > recent Buildroot, using gcc 4.9 as the default, and having one
 > toolchain using gcc 5.1 to catch issues. Should I do this?

I think it would be interesting to do so, yes.

Thanks!

-- 
Bye, Peter Korsgaard
