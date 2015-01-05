From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jan 2015 15:14:15 +0100
Subject: [Buildroot] [PATCH 1/2] package/shairport-sync: bump to version
 2.1.15
In-Reply-To: <1420466748-6155-1-git-send-email-jkrause@posteo.de>
References: <1420466748-6155-1-git-send-email-jkrause@posteo.de>
Message-ID: <20150105151415.3196da3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon,  5 Jan 2015 15:05:47 +0100, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  .../0001-fix-static-link-openssl.patch             | 41 ----------------------
>  .../shairport-sync/0002-fix-static-link-alsa.patch | 27 --------------
>  .../shairport-sync/0003-fix-static-link-popt.patch | 25 -------------
>  package/shairport-sync/shairport-sync.mk           |  2 +-
>  4 files changed, 1 insertion(+), 94 deletions(-)
>  delete mode 100644 package/shairport-sync/0001-fix-static-link-openssl.patch
>  delete mode 100644 package/shairport-sync/0002-fix-static-link-alsa.patch
>  delete mode 100644 package/shairport-sync/0003-fix-static-link-popt.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
