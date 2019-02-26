From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Feb 2019 13:10:38 +0100
Subject: [Buildroot] [PATCH] package/gcc: bump to version 8.3.0
In-Reply-To: <20190224160529.6038-1-romain.naour@smile.fr> (Romain Naour's
 message of "Sun, 24 Feb 2019 17:05:29 +0100")
References: <20190224160529.6038-1-romain.naour@smile.fr>
Message-ID: <87wolmda2p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Remove upsteam xtensa patches:
 > https://github.com/gcc-mirror/gcc/commit/68ca69a4854af36c90531b33a4c540464dbc6a23
 > https://github.com/gcc-mirror/gcc/commit/972057cb254e355805bfcd4a47d5c6f743cb76f4

 > Tested using Toolchain-builder:
 > https://gitlab.com/kubu93/toolchains-builder/pipelines/48904471

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > ---
 > There is an existing issue between gdb 8.1.1, musl and kernel-headers
 > related to aarch64 SVE support.
 > See the same issue with gdb 8.2:
 > http://patchwork.ozlabs.org/patch/1030704/
 > http://patchwork.ozlabs.org/patch/1030703/

 > The bleeding-edge toolchain I tested use kernel-headers 4.19 that
 > break gdb 8.1.1 with musl toolchain.
 > Using kernel-headers 4.14 build fine.

 > This issue is not related to the gcc version bump.

Given that this is a bugfix release I have committed to master, thanks.

Great to see that we no longer need to carry local patches.

-- 
Bye, Peter Korsgaard
