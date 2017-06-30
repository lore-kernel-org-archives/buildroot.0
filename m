From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 00:14:42 +0200
Subject: [Buildroot] [PATCH 2/2] boot/syslinux: Drop patch 0008,
 integrated in the dependency upstream
In-Reply-To: <1498820316-2715-2-git-send-email-benoit.allard@greenbone.net>
References: <1498820316-2715-1-git-send-email-benoit.allard@greenbone.net>
 <1498820316-2715-2-git-send-email-benoit.allard@greenbone.net>
Message-ID: <20170701001442.2f6120bc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Jun 2017 12:58:36 +0200, Beno?t Allard wrote:
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
> ---
>  ..._BASE_CODE-struct-has-been-renamed-to-EFI.patch | 30 ----------------------
>  1 file changed, 30 deletions(-)
>  delete mode 100644 boot/syslinux/0008-The-EFI_PXE_BASE_CODE-struct-has-been-renamed-to-EFI.patch

I've applied to master, but after rewriting the commit log to add more
details. It took me a while to understand what you meant by "integrated
in the dependency upstream", so it should have been made clearer in the
commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
