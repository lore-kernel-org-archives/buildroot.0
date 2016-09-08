From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 22:04:01 +0200
Subject: [Buildroot] [PATCH] util-linux: bump version to 2.28.2
In-Reply-To: <1473263687-48196-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1473263687-48196-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160908220401.263ee44a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 7 Sep 2016 16:54:47 +0100, Vicente Olivert Riera wrote:
> --enable-findfs and --enable-lsblk configure options don't exist
> anymore. Now, findfs and lsblk are always built by default unless you
> pass --disable-all-programs to the configure script.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/util-linux/Config.in       | 10 ----------
>  package/util-linux/util-linux.hash |  2 +-
>  package/util-linux/util-linux.mk   |  4 +---
>  3 files changed, 2 insertions(+), 14 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
