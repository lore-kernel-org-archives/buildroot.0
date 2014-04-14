From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 22:42:40 +0200
Subject: [Buildroot] [PATCH v4] toolchain-external: Introduce kernel
 headers sanitization
In-Reply-To: <1397482805-14421-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1397482805-14421-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20140414224240.476d4996@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Mon, 14 Apr 2014 10:40:05 -0300, Ezequiel Garcia wrote:
> The Nios-II Sourcery external toolchain (the only Nios-II we currently
> support) exports broken kernel headers. In particular, these kernels should
> be exported using the "headers_install" rule which applies a set of fixes
> on the kernel headers so they are suitable for userspace usage.
> 
> In order to fix this, add a post-install hook to perform the header fixes
> ourselves. The result is equivalent to apply the "headers_install" rule.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c32/c32ad4bac5f651502e551f7733f702afaa0e742a/
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
