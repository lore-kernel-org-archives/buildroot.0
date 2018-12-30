From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 20:15:55 +0100
Subject: [Buildroot] [PATCH] package/sngrep: fix build with musl libc
In-Reply-To: <04bdf53b08f3f7c511f730fb1bd6bd61f4966115.1546192196.git.baruch@tkos.co.il>
References: <04bdf53b08f3f7c511f730fb1bd6bd61f4966115.1546192196.git.baruch@tkos.co.il>
Message-ID: <20181230201555.620e48c5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Dec 2018 19:49:56 +0200, Baruch Siach wrote:
> Add upstream patch fixing typo that causes build failure under musl,
> where stdin is constant.
> 
> Cc: Adam Duskett <aduskett@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...0001-capture-fix-typo-in-FILE-object.patch | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/sngrep/0001-capture-fix-typo-in-FILE-object.patch

Applied to master after adjusting the commit log with a reference to
the autobuilder failures.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
