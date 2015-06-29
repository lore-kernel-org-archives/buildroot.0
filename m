From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jun 2015 22:10:17 +0200
Subject: [Buildroot] [PATCH] systemd: bump to version 221
In-Reply-To: <1435583683-6642-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1435583683-6642-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150629221017.39856151@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 29 Jun 2015 15:14:43 +0200, Vicente Olivert Riera wrote:
> - Bump to version 221
> - Update hash file
> 
> - Add --disable-gnuefi to configure options to avoid a failure like this
>   one:
> 
>   checking for /usr/lib/gnuefi/elf_ia32_efi.lds... configure: error:
>   cannot check for file existence when cross compiling
> 
> - Remove gudev logic since it has been removed from the systemd tree and
>   it is now an external project.
> 
> Announcement URL:
> 
>   http://lists.freedesktop.org/archives/systemd-devel/2015-June/033170.html
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/systemd/systemd.hash |  2 +-
>  package/systemd/systemd.mk   | 10 ++--------
>  2 files changed, 3 insertions(+), 9 deletions(-)

Applied, thanks. It would be good if someone can investigate the GNU
EFI issue, and see if it makes sense to fix it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
