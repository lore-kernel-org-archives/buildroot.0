From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Mar 2020 21:56:47 +0100
Subject: [Buildroot] [PATCH] package/glibc/riscv32: update LICENSE file
 hash
In-Reply-To: <20200203135022.91206-1-romain.naour@smile.fr> (Romain Naour's
 message of "Mon, 3 Feb 2020 14:50:22 +0100")
References: <20200203135022.91206-1-romain.naour@smile.fr>
Message-ID: <87k13vx4s0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > The LICENSE file hash wasn't changed with the last glibc bump for riscv32 [1].
 > The change is due to upstream LICENSE file update between glibc 2.26 and 2.29
 > [2] [3].

 > This issue was discovered by toolchain-builder [4].

 > [1] a4958567284026f979f6e0056a5b98bedd77e88f
 > [2] https://sourceware.org/git/?p=glibc.git;a=commit;h=7f9f1ecb710eac4d65bb02785ddf288cac098323
 > [3] https://sourceware.org/git/?p=glibc.git;a=commit;h=5a357506659f9a00fcf5bc9c5d8fc676175c89a7
 > [4] https://gitlab.com/kubu93/toolchains-builder/-/jobs/423826546

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Alistair Francis <alistair@alistair23.me>
 > Cc: Mark Corbin <mark@dibsco.co.uk>

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
