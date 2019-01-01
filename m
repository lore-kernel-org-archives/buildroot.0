From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Jan 2019 22:58:44 +0100
Subject: [Buildroot] [PATCH v2 0/4] Support Linux 4.20
In-Reply-To: <20181231175234.14572-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 31 Dec 2018 18:52:30 +0100")
References: <20181231175234.14572-1-thomas.petazzoni@bootlin.com>
Message-ID: <87sgycox9n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > This adds support for using Linux 4.20 for the kernel headers and/or
 > kernel build.

 > Amongst other things, Linux 4.20 has the fix of the net_tstamp.h
 > header which will fix the build failure of linuxptp.

 > Changes since v1:

 >  - Add one more patch that makes it possible to use custom external
 >    toolchains that use Linux 4.20 kernel headers, as noticed by Romain
 >    Naour.

 > Thomas Petazzoni (4):
 >   toolchain: add necessary options to support 4.20 kernel headers
 >   package/linux-headers: add support for Linux 4.20 kernel headers
 >   linux: add support for Linux 4.20
 >   toolchain/toolchain-external-custom: support Linux 4.20 kernel headers

Committed series, thanks.

With 2019.02 becoming our next LTS and 4.20 NOT a LTS release, I wonder
if it would make sense to still default to 4.19.x instead of 4.20.x?

-- 
Bye, Peter Korsgaard
