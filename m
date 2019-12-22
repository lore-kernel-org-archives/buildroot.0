From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 22:30:08 +0100
Subject: [Buildroot] [PATCH] package/wolfssl: bump to version 4.3.0
In-Reply-To: <20191222101807.5936-1-sergio.prado@e-labworks.com>
References: <20191222101807.5936-1-sergio.prado@e-labworks.com>
Message-ID: <20191222223008.4c472b08@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Dec 2019 07:18:07 -0300
Sergio Prado <sergio.prado@e-labworks.com> wrote:

> Remove patch already applied upstream (refactored on commit c06efb6c1fda0)
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  ...e-location-index-hasn-t-exceed-maxim.patch | 84 -------------------
>  package/wolfssl/wolfssl.hash                  |  2 +-
>  package/wolfssl/wolfssl.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 86 deletions(-)
>  delete mode 100644 package/wolfssl/0001-Check-domain-name-location-index-hasn-t-exceed-maxim.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
