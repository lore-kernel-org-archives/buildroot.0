From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2016 21:42:23 +0200
Subject: [Buildroot] [PATCH] libseccomp: bump version to 2.3.1
In-Reply-To: <1470148914-12757-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1470148914-12757-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160802214223.615d14b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Aug 2016 09:41:54 -0500, Matt Weber wrote:
> From: Judd Meinders <judd.meinders@rockwellcollins.com>
> 
> Bump libseccomp version to 2.3.1 to enable power architectures.
> 
> Signed-off-by: Judd Meinders <judd.meinders@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/libseccomp/0002-musl.patch | 28 ----------------------------
>  package/libseccomp/Config.in       |  3 ++-
>  package/libseccomp/libseccomp.hash |  2 +-
>  package/libseccomp/libseccomp.mk   |  2 +-
>  4 files changed, 4 insertions(+), 31 deletions(-)
>  delete mode 100644 package/libseccomp/0002-musl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
