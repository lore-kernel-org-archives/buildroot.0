From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 17:42:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/libodb-mysql: fix static build
In-Reply-To: <20201214214313.447831-1-fontaine.fabrice@gmail.com>
References: <20201214214313.447831-1-fontaine.fabrice@gmail.com>
Message-ID: <20201231174246.09fd5d10@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Dec 2020 22:43:13 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/ba2c5ef1bb54c2751569f79beef21ff486348469
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libodb-mysql/libodb-mysql.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks. I think this issue only appears with
per-package directories, and indeed the failed configuration you're
pointing has BR2_PER_PACKAGE_DIRECTORIES=y.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
