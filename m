From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Jan 2014 21:40:08 +0100
Subject: [Buildroot] [PATCH v4] arch: add support for "jaguar" AMD CPU
	optimisations.
In-Reply-To: <403077357.139986.1389802808673.JavaMail.root@mail> ("Adrien
 =?utf-8?Q?B=C3=A9raud=22's?= message of "Wed, 15 Jan 2014 11:20:08 -0500
 (EST)")
References: <403077357.139986.1389802808673.JavaMail.root@mail>
Message-ID: <87d2jtt1w7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrien" == Adrien B?raud <adrien.beraud@savoirfairelinux.com> writes:

 > AMD Jaguar ( https://en.wikipedia.org/wiki/Jaguar_%28microarchitecture%29 ) is suddenly
 > a popular architecture since it is used in the PS4 and the XBox One.
 > Many embedded systems are also likely to use it in the next years.

 > This patch adds support for GCC architecture-specific optimizations and tuning for these CPUs.
 > These optimizations are available with GCC 4.8+.

 > Signed-off-by: Adrien Beraud <adrien.beraud@savoirfairelinux.com>

Thanks, looks good - But it doesn't apply to current git:

Applying: arch: add support for "jaguar" AMD CPU optimisations.
Using index info to reconstruct a base tree...
M       arch/Config.in.x86
M       package/gcc/Config.in.host
M       toolchain/toolchain-external/Config.in
Falling back to patching base and 3-way merge...
Auto-merging toolchain/toolchain-external/Config.in
Auto-merging package/gcc/Config.in.host
CONFLICT (content): Merge conflict in package/gcc/Config.in.host
Auto-merging arch/Config.in.x86
Failed to merge in the changes.
Patch failed at 0001 arch: add support for "jaguar" AMD CPU optimisations.

Care to rebase against git HEAD and resubmit? Thanks.

-- 
Bye, Peter Korsgaard
