From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Sep 2015 19:45:22 +0200
Subject: [Buildroot] [PATCH] util-linux: bump version to 2.27
In-Reply-To: <1441977987-43640-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441977987-43640-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150911194522.265041cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 11 Sep 2015 14:26:27 +0100, Vicente Olivert Riera wrote:
> Removed 0002-program-invocation-short-name.patch since the changes it
> does are now upstream:
> 
>   https://kernel.googlesource.com/pub/scm/utils/util-linux/util-linux/+/37edac9a0ca83f311279d2e49bacd6ac80310dc8
> 
> This release includes a security fix:
> 
> CVE-2015-5224 - chfn, chsh file name collision due to incorrect mkstemp
> use if compiled without libuser.
> [thanks to Qualys Security Advisory team; qualys.com]
> 
> Release notes here:
> 
>   https://www.kernel.org/pub/linux/utils/util-linux/v2.27/v2.27-ReleaseNotes
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  .../0002-program-invocation-short-name.patch       |   11 -----------
>  package/util-linux/util-linux.hash                 |    4 ++--
>  package/util-linux/util-linux.mk                   |    4 ++--
>  3 files changed, 4 insertions(+), 15 deletions(-)
>  delete mode 100644 package/util-linux/0002-program-invocation-short-name.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
