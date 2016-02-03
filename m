From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 23:46:11 +0100
Subject: [Buildroot] [PATCH RFC 1/2] toolchain: copy_toolchain_lib_root:
 rename LIBSPATH to LIBPATHS
In-Reply-To: <1454535929-25379-2-git-send-email-patrickdepinguin@gmail.com>
References: <1454535929-25379-1-git-send-email-patrickdepinguin@gmail.com>
 <1454535929-25379-2-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160203234611.5108bfcd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed,  3 Feb 2016 22:45:28 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> LIBSPATH is populated based on a find with a pattern that can look like:
>     libfoo*.so
> and thus the output of the find will contain all file paths that match this
> pattern.
> 
> Unfortunately, the name LIBSPATH suggests that only one entry is returned,
> rather than possibly multiple.
> 
> As this code is quite complex, use the more accurate name LIBPATHS iso
> LIBSPATH.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  toolchain/helpers.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
