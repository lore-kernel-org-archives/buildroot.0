From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Apr 2019 14:58:44 +0200
Subject: [Buildroot] [PATCH] package/cgilua: bump to version 5.2.1
In-Reply-To: <20190414101451.29181-1-francois.perrad@gadz.org>
References: <20190414101451.29181-1-francois.perrad@gadz.org>
Message-ID: <20190414145844.40fe2dae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Apr 2019 12:14:51 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> The hash of the license file changes only due to a style sheet changes:
> 
> -    <link rel="stylesheet" href="http://www.keplerproject.org/doc.css" type="text/css"/>
> +    <link rel="stylesheet" href="doc.css" type="text/css"/>
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/cgilua/cgilua.hash | 4 ++--
>  package/cgilua/cgilua.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
