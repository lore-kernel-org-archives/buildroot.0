From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 20:58:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/oprofile: fix configure test
 with gcc 4.9.x
In-Reply-To: <1408296131-15354-1-git-send-email-romain.naour@openwide.fr>
References: <1408296131-15354-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140817205817.32995ca7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 17 Aug 2014 19:22:11 +0200, Romain Naour wrote:
> Backport the upstream patch that fix a configure test breaked with gcc 4.9.x.
> 
> This patch must be removed with the next version bump.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f80/f8083f038d0efb7b5becf7810b6fcaf440fb8294/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  ...e-fix-test-for-synth-check-with-GCC-4.9.0.patch | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/oprofile/oprofile-003-configure-fix-test-for-synth-check-with-GCC-4.9.0.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
