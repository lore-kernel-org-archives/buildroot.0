From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 23:00:56 +0100
Subject: [Buildroot] [PATCH] package/stella: bump version to 6.0
In-Reply-To: <20190302095005.9862-1-sergio.prado@e-labworks.com>
References: <20190302095005.9862-1-sergio.prado@e-labworks.com>
Message-ID: <20190307230056.4a58613a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  2 Mar 2019 06:50:05 -0300
Sergio Prado <sergio.prado@e-labworks.com> wrote:

> - add hashes for license files
> - remove patch with changes already upstream [1]
> 
> [1] https://github.com/stella-emu/stella/commit/483013baa7b357fdf0daa2e510c537d460132584
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  ...x-error-when-building-with-uClibc-ng.patch | 54 -------------------
>  package/stella/stella.hash                    |  4 +-
>  package/stella/stella.mk                      |  2 +-
>  3 files changed, 4 insertions(+), 56 deletions(-)
>  delete mode 100644 package/stella/0003-Fix-error-when-building-with-uClibc-ng.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
