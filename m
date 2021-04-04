From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Apr 2021 21:08:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/botan: fix build with riscv32
In-Reply-To: <20210404102613.GG2252@scaer> (Yann E. MORIN's message of "Sun, 4
 Apr 2021 12:26:13 +0200")
References: <20210403152930.2221759-1-fontaine.fabrice@gmail.com>
 <20210404102613.GG2252@scaer>
Message-ID: <871rbpzx4e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fabrice, All,
 > On 2021-04-03 17:29 +0200, Fabrice Fontaine spake thusly:
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/1c399312dbec5d7a28ec90d62fdd8f47fa14ff4b

 > Technically, this is not a bug fix, but support for a new architecture,
 > akin to a new feature. But since this is an upstream commit, this is OK
 > to backport, as we can drop the patch when we next update the version.

 > Applied to master, thanks.

And since the patch is so small and unlikely to cause regressions for
other architectures, committed to 2021.02.x as well - Thanks.

-- 
Bye, Peter Korsgaard
