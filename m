From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 13:08:27 +0100
Subject: [Buildroot] [PATCH 1/3] qemu: bump version to 2.5.0
In-Reply-To: <1450353428-57815-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1450353428-57815-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151217130827.02b481e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 17 Dec 2015 11:57:06 +0000, Vicente Olivert Riera wrote:
> - Bump version to 2.5.0.
> 
> - Update hash file.
> 
> - Remove upstreamed patch:
> 
>   http://git.qemu.org/?p=qemu.git;a=commit;h=fccd35a04640a728f979e6d72b2c7d02c05549f0
> 
> - Remove non-existent configure options:
> 
>   ERROR: unknown option --disable-guest-base
>   Try './configure --help' for more information
> 
>   ERROR: unknown option --disable-smartcard-nss
>   Try './configure --help' for more information
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...se-appropriate-code-fragment-for-fstack-p.patch | 58 ----------------------
>  package/qemu/qemu.hash                             |  2 +-
>  package/qemu/qemu.mk                               |  4 +-
>  3 files changed, 2 insertions(+), 62 deletions(-)
>  delete mode 100644 package/qemu/0001-configure-use-appropriate-code-fragment-for-fstack-p.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
