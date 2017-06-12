From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jun 2017 23:55:31 +0200
Subject: [Buildroot] [PATCH] syslinux: Add patch to build efi/wrapper
 with the host toolchain
In-Reply-To: <1497273401-4010-1-git-send-email-benoit.allard@greenbone.net>
References: <1497273401-4010-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <20170612235531.2744c30e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 15:16:41 +0200, Beno?t Allard wrote:
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
> ---
>  ...-wrapper-build-it-with-the-host-toolchain.patch | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 boot/syslinux/0010-efi-wrapper-build-it-with-the-host-toolchain.patch

Applied to master, thanks. I've tested locally, and it fixes my
problem. It's worth mentioning that I have extended a bit your commit
log, and the patch description, because it was very terse.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
