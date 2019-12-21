From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 22:58:04 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/libnetconf2: bump to version
 1.1.3
In-Reply-To: <20191220135345.16045-3-heiko.thiery@gmail.com>
References: <20191220135345.16045-1-heiko.thiery@gmail.com>
 <20191220135345.16045-3-heiko.thiery@gmail.com>
Message-ID: <20191221225804.16802d6d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 20 Dec 2019 14:53:44 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Other changes:
> 
>  - Remove patch (already in upstream version)
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
> ---
>  .../0001-Add-support-for-musl-libc.patch      | 65 -------------------
>  package/libnetconf2/libnetconf2.hash          |  2 +-
>  package/libnetconf2/libnetconf2.mk            |  2 +-
>  3 files changed, 2 insertions(+), 67 deletions(-)
>  delete mode 100644 package/libnetconf2/0001-Add-support-for-musl-libc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
