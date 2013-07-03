From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jul 2013 23:25:02 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 3.0.x / 3.4.x /
 3.9.x stable versions
In-Reply-To: <20130703191057.2EF969A19A@busybox.osuosl.org>
References: <20130703191057.2EF969A19A@busybox.osuosl.org>
Message-ID: <20130703232502.2259d23a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 3 Jul 2013 21:08:21 +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=8a3992e897bde8649f922e2b15ca5225490e1166
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  toolchain/kernel-headers/Config.in                 |    6 +++---
>  ...all-fix-__packed-in-exported-kernel-head.patch} |    0
>  2 files changed, 3 insertions(+), 3 deletions(-)

This will conflict when applying the conversion of linux-headers to the
package infrastructure.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
