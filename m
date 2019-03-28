From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 17:08:05 +0100
Subject: [Buildroot] [PATCH v2] package/lua-gd: new package
In-Reply-To: <20190327103047.25916-1-francois.perrad@gadz.org>
References: <20190327103047.25916-1-francois.perrad@gadz.org>
Message-ID: <20190328170805.06f7c3de@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 27 Mar 2019 11:30:47 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                             |  1 +
>  ...ion-of-LgdImageCreateFromPng-with-GD.patch | 34 +++++++++++++++++++
>  package/lua-gd/Config.in                      |  7 ++++
>  package/lua-gd/lua-gd.hash                    |  3 ++
>  package/lua-gd/lua-gd.mk                      | 27 +++++++++++++++
>  5 files changed, 72 insertions(+)
>  create mode 100644 package/lua-gd/0001-Protect-declaration-of-LgdImageCreateFromPng-with-GD.patch
>  create mode 100644 package/lua-gd/Config.in
>  create mode 100644 package/lua-gd/lua-gd.hash
>  create mode 100644 package/lua-gd/lua-gd.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
