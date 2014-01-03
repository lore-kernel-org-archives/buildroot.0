From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jan 2014 21:03:46 +0100
Subject: [Buildroot] [PATCH] e2fsprogs: fix posix_fadvise() signature
 mismatch
In-Reply-To: <87bd00c09f1944edad28fe21411f1e8ab252968e.1388574955.git.baruch@tkos.co.il>
References: <87bd00c09f1944edad28fe21411f1e8ab252968e.1388574955.git.baruch@tkos.co.il>
Message-ID: <20140103210346.0e9fab44@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed,  1 Jan 2014 13:16:36 +0200, Baruch Siach wrote:
> Fixes
> http://autobuild.buildroot.net/results/79c/79cdb149d349ce9fe2dffbf53e3ff127a050ed24/.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...g-fix-build-when-posix_fadvise-is-missing.patch | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/e2fsprogs/e2fsprogs-0002-e4defrag-fix-build-when-posix_fadvise-is-missing.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
