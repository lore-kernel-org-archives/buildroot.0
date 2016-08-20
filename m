From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 20:02:22 +0200
Subject: [Buildroot] fixdep not found
In-Reply-To: <CAK7rcp-qDKDR-qGPVBoUfpwCj22Qs4dmjvFg_=uaZok_kHC-nQ@mail.gmail.com>
References: <CAK7rcp-qDKDR-qGPVBoUfpwCj22Qs4dmjvFg_=uaZok_kHC-nQ@mail.gmail.com>
Message-ID: <20160820200222.1657adb4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 12:24:37 -0400, Kenneth Adam Miller wrote:

> 
> I'm trying to build a linux, version 3.14.51 with the buildroot
> toolchain, gcc version 5.x and uclibc-ng. I also have Kernel headers
> set to same as kernel being built an customer kernel header series set
> to 3.14.x
> 
> I'm getting an issue during >>> linux-headers 3.14.51 Configuring
> where it executes a make ... headers_install, and then goes to execute
> scripts/basic/fixdep, but cannot find it. I can see that fixdep must
> be compiled from fixdep.c, which I can find within the particular
> build directory. But it's not already compiled when buildroot
> generates code that would depend on it.

Please indicate which Buildroot version you're using, attach your
Buildroot configuration file, and copy/paste the last ~100 lines of the
build log.

Without this, we cannot reproduce the problem. And without the exact
build output, we cannot really investigate the problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
