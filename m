From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Nov 2016 23:15:13 +0100
Subject: [Buildroot] [PATCH v3 1/1] libxmlrpc: bump to 1.39.11
In-Reply-To: <1479207044-12290-1-git-send-email-alvaro.gamez@hazent.com>
References: <CAM+bi4vAks48DSkjARGDsoMiG7p+X=+frremEZbjaQnG5GQHYw@mail.gmail.com>
 <1479207044-12290-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20161116231513.62d80a13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Nov 2016 11:50:44 +0100, Alvaro G. M wrote:
> Previous version patches are still needed, but they have been
> upgraded to apply cleanly.
> 
> This also reverts aa9fde1c459dbc20b268694eafd7a1d3341dbf76, as that
> patch is already on upstream.
> 
> Signed-off-by: Alvaro Gamez <alvaro.gamez@hazent.com>
> ---
>  package/libxmlrpc/0001-fix-gennmtab-build.patch    |  2 +-
>  .../libxmlrpc/0004-use-correct-curl-config.patch   | 36 +++-------------------
>  package/libxmlrpc/0006-narrowing.patch             | 20 ------------
>  package/libxmlrpc/libxmlrpc.hash                   |  2 +-
>  package/libxmlrpc/libxmlrpc.mk                     |  4 +--
>  5 files changed, 9 insertions(+), 55 deletions(-)
>  delete mode 100644 package/libxmlrpc/0006-narrowing.patch

Applied to next, thanks. I've fixed the ar/ranlib issue by adding
another patch (patch 0006).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
