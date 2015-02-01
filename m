From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 23:23:22 +0100
Subject: [Buildroot] [PATCH 1/2] uclibc/0.9.33.2: Rename MIPS' siginfo
 _timer members
In-Reply-To: <1422628433-39741-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1422628433-39741-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150201232322.26bd9049@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 30 Jan 2015 14:33:52 +0000, Vicente Olivert Riera wrote:
> Backport an upstream patch to fix a compilation problem of strace-4.9+
> on MIPS platforms with uClibc.
> 
> Upstream commit:
>   http://git.uclibc.org/uClibc/commit/?id=a1b88fe87a9d2be5696247d266f5c4fd20f000bb
> 
> Fixes:
>   http://autobuild.buildroot.net/results/e8f/e8f4965b27c9dcc58d6ec77cdc48b83c218c5bec/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Both patches applied.

Can you get ready to submit autobuild-run patches? strace will start
failing on MIPS/uClibc external toolchains, since those don't have the
necessary uClibc patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
