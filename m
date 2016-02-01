From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 14:26:59 +0100
Subject: [Buildroot] [PATCH v12 1/3] toolchain-external: don't exclude
 too much lib in sysroot rsync
In-Reply-To: <1453984366-12393-1-git-send-email-patrickdepinguin@gmail.com>
References: <1453984366-12393-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160201142659.15d9d3b9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 28 Jan 2016 13:32:44 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> The copy_toolchain_sysroot helper in toolchain/helpers.mk performs an
> rsync of various directories from the extracted external toolchain to the
> corresponding directory in staging.

[...]

Better late than never, I've finally applied your patch series, after
making sure that a build + minimal run-time test of a minimal ARM
system based on a Linaro toolchain still works fine.

Thanks for this work, and thanks to Romain for being brave enough to
analyze, review and test those patches!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
