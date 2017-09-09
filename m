From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:18:50 +0200
Subject: [Buildroot] [PATCH] libcurl: bump to version 7.55.1
In-Reply-To: <1d6c2c5121767c5cdd5d1f96be857d2f3a937c15.1504987855.git.baruch@tkos.co.il>
References: <1d6c2c5121767c5cdd5d1f96be857d2f3a937c15.1504987855.git.baruch@tkos.co.il>
Message-ID: <20170909221850.1d15b412@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Sep 2017 23:10:55 +0300, Baruch Siach wrote:
> Drop upstream patch.
> 
> Add license hash.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...-curl-system.h-support-more-architectures.patch | 47 ----------------------
>  package/libcurl/libcurl.hash                       |  5 ++-
>  package/libcurl/libcurl.mk                         |  2 +-
>  3 files changed, 4 insertions(+), 50 deletions(-)
>  delete mode 100644 package/libcurl/0001-curl-system.h-support-more-architectures.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
