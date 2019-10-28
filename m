From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2019 17:39:02 +0100
Subject: [Buildroot] [PATCH] docs/manual: fix Config.in option that
 cargo packages must depend on
In-Reply-To: <20191005214511.25905-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 5 Oct 2019 23:45:10 +0200")
References: <20191005214511.25905-1-thomas.petazzoni@bootlin.com>
Message-ID: <87woco6d09.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Back in commit 025b863e6facb7b219b82ee6ee7a7916c2c3c47e, the option
 > BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS was introduced, to
 > separate the option that host packages needing Rust should depend on
 > (BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS) from the option that target
 > packages needing Rust should depend on
 > (BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS).

 > Since the example in the manual is showing a target package, we must
 > use BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Sam Voss <sam.voss@gmail.com>
 > Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
