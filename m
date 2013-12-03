From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Dec 2013 22:55:54 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-12-02
In-Reply-To: <20131203073003.0FA7E1014F4@stock.ovh.net>
References: <20131203073003.0FA7E1014F4@stock.ovh.net>
Message-ID: <20131203225554.361342f7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  3 Dec 2013 08:30:02 +0100 (CET), Thomas Petazzoni wrote:

>        arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/73d736dd3c8a70358ef4b19a63dda46178cf8bf1/
>        arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/e7e20082e3abb9c6d2a5a5b3e8970b8b1d2c2545/

I've sent a patch to fixe those failures.

>   mips64el |                   squid-3.3.10 | NOK | http://autobuild.buildroot.net/results/1e3c583c88f44eafe9047bf32886e0ec03f41549/
>   mips64el |                   squid-3.3.10 | NOK | http://autobuild.buildroot.net/results/2c3a9801eb816eba0ec85dfeeb41ebd1aa3ddbdf/

As I replied to Vicente, I have fixed those in the autobuilder scripts.
We'll see if it works fine.

>     x86_64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/106e6d907126ef4b73617d0253c2f47825876ab1/
>      nios2 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/489dbc7ed41ded35239994b6ea8bd5b396438999/

I've also fixed those ones. Same thing, we'll see if it works properly
with the next days of builds.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
