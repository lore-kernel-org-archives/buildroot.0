From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 22:29:53 +0200
Subject: [Buildroot] [PATCH 1/1] util-linux: bump to v2.30.1
In-Reply-To: <20170729153602.22599-1-m.hoffmann@cartelsol.com>
References: <20170729153602.22599-1-m.hoffmann@cartelsol.com>
Message-ID: <20170729222953.1b62c952@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Jul 2017 17:36:02 +0200, Marcus Hoffmann wrote:
> - Drop patch 0002-column-fix-compilation-when-libc-lacks-wide-characte.patch
> as it has been applied upstream
> - Patch 0001-Revert-build-sys-ncurses-headers-cleanup.patch is still
> required to fix ncursesw support.
> 
> Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
> Cc: "Carlos Santos" <casantos@datacom.ind.br>
> ---
> @Carlos: As far as I could find no upstream discussion has taken place
> regarding the 0001 patch right? Do you want to send an email to the list
> describing the problem?
> ---
>  ...compilation-when-libc-lacks-wide-characte.patch | 53 ----------------------
>  package/util-linux/util-linux.hash                 |  2 +-
>  package/util-linux/util-linux.mk                   |  3 +-
>  3 files changed, 3 insertions(+), 55 deletions(-)
>  delete mode 100644 package/util-linux/0002-column-fix-compilation-when-libc-lacks-wide-characte.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
