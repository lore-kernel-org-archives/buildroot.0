From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 23:56:13 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/python-pycryptodomex: bump
 to version 3.9.8
In-Reply-To: <20200722071030.16128-2-hi@senzilla.io>
References: <20200722071030.16128-1-hi@senzilla.io>
 <20200722071030.16128-2-hi@senzilla.io>
Message-ID: <20200808235613.563a26ea@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Jul 2020 07:11:08 +0000
Dick Olsson <hi@senzilla.io> wrote:

> Changelog: https://www.pycryptodome.org/en/latest/src/changelog.html#june-2020
> 
> Signed-off-by: Dick Olsson <hi@senzilla.io>
> ---
>  package/python-pycryptodomex/python-pycryptodomex.hash | 4 +---
>  package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 5 deletions(-)

Thanks for this contribution. However, in the mean time, another
similar patch was merged, which was more correct (i.e the changes in
the hash file were not completely correct in your submission).

However, I'll go ahead and apply the rest of your series. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
