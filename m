From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 21:55:24 +0100
Subject: [Buildroot] [PATCH v11 1/4] skeleton: move LIB_SYMLINK
 definition from Makefile
In-Reply-To: <1453317091-17676-1-git-send-email-patrickdepinguin@gmail.com>
References: <1453317091-17676-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160120215524.5891bad9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 20 Jan 2016 20:11:28 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Commit 7a6b83a211612ff95a1f5d35b2861ad5655ac8b1 introduced the skeleton
> package, which took over the lib32/lib64 -> lib symlink creation from the
> main Makefile.
> However, the definition of the LIB_SYMLINK variable did not move along, for
> no real reason.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> v11: place LIB_SYMLINK in skeleton iso toolchain/helpers.mk (ThomasP)
> v10: new patch

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
