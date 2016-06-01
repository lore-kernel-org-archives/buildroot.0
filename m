From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 23:39:44 +0200
Subject: [Buildroot] [PATCH 3/3] package/tinc: bump version to 1.0.28
In-Reply-To: <1463919991-28382-3-git-send-email-bernd.kuhls@t-online.de>
References: <1463919991-28382-1-git-send-email-bernd.kuhls@t-online.de>
 <1463919991-28382-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160601233944.71bbbced@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 May 2016 14:26:31 +0200, Bernd Kuhls wrote:
> This patch can be applied after the release of buildroot 2016.05.
> 
> Removed 0001-musl.patch, applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tinc/0001-musl.patch | 32 --------------------------------
>  package/tinc/tinc.hash       |  2 +-
>  package/tinc/tinc.mk         |  2 +-
>  3 files changed, 2 insertions(+), 34 deletions(-)
>  delete mode 100644 package/tinc/0001-musl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
