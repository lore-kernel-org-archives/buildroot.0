From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 21:52:18 +0200
Subject: [Buildroot] [PATCH] ntfs-3g: bump version to 2017.3.23
In-Reply-To: <20170329135136.8459-1-Vincent.Riera@imgtec.com>
References: <20170329135136.8459-1-Vincent.Riera@imgtec.com>
Message-ID: <20170329215218.56fe05ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Mar 2017 14:51:36 +0100, Vicente Olivert Riera wrote:
> And remove patches already included in this release.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...-libfuse-util-include-paths.h-when-needed.patch | 43 ----------------------
>  package/ntfs-3g/ntfs-3g.hash                       |  3 +-
>  package/ntfs-3g/ntfs-3g.mk                         |  3 +-
>  3 files changed, 2 insertions(+), 47 deletions(-)
>  delete mode 100644 package/ntfs-3g/0001-libfuse-util-include-paths.h-when-needed.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
