From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 22:49:37 +0100
Subject: [Buildroot] [PATCH v2] package/qt5/qt5base: handle
 sse2/sse3/ssse3/sse4.1/sse4.2/avx/avx2 configuration
In-Reply-To: <20190205214122.25115-1-ps.report@gmx.net>
References: <20190205214122.25115-1-ps.report@gmx.net>
Message-ID: <20190215224937.067eaacf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Feb 2019 22:41:22 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> The Qt configure auto detection (and announced runtime detection
> feature) failes (see e.g. [1]), so override the configuration
> with the buildroot determined settings.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2019-January/241862.html
> 
> Reported-by: David Picard <dplamp@gmx.com>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - use 'else ifeq' (suggested by Thomas Petazzoni)
>   - fix typo (anounced vs. announced)
>   - clarify no-avx512 comment

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
