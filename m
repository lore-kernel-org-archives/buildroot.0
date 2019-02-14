From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Feb 2019 21:52:58 +0100
Subject: [Buildroot] [PATCH 1/2] support/config-fragments/autobuild:
 update all pre-built Buildroot toolchains
In-Reply-To: <20190214103619.31068-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 14 Feb 2019 11:36:18 +0100")
References: <20190214103619.31068-1-thomas.petazzoni@bootlin.com>
Message-ID: <87imxmgkid.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > All toolchains have been rebuilt with Buildroot 2019.02-rc1.
 > Changes:

 > - Toolchains that were using no-longer maintained kernel headers
 >   versions have been changed to use a variety of newer kernel headers
 >   versions (4.4, 4.9 or 4.14).

 > - Since gcc 7.x is now the default in Buildroot, most toolchains that
 >   simply use the default gcc version use 7.x instead of 6.x.

 > - br-arm-cortex-a9-glibc uses gcc 8.x, binutils 2.31 and kernel
 >   headers 4.20

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
