From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 14:50:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/musl: bump to version 1.1.10
In-Reply-To: <1434286024-8268-1-git-send-email-joerg.krause@embedded.rocks>
References: <1434286024-8268-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150614145016.6bae0782@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sun, 14 Jun 2015 14:47:04 +0200, J?rg Krause wrote:
> A new regression in uselocale made it into this release. As suggested [1] by the
> musl maintainers add a patch from upstream [2] to avoid breaking programs that
> call uselocale.
> 
> [1]
> http://www.musl-libc.org/download.html
> 
> [2]
> http://git.musl-libc.org/cgit/musl/patch/?id=63f4b9f18f3674124d8bcb119739fec85e6da005
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/musl/0001-fix-uselocale.patch | 30 ++++++++++++++++++++++++++++++
>  package/musl/musl.hash                |  2 +-
>  package/musl/musl.mk                  |  2 +-
>  3 files changed, 32 insertions(+), 2 deletions(-)
>  create mode 100644 package/musl/0001-fix-uselocale.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
