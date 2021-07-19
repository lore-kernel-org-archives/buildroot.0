From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 23:18:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: bump to version
 2.17.0
In-Reply-To: <20210719112648.367298-1-egorenar@linux.ibm.com>
References: <20210719112648.367298-1-egorenar@linux.ibm.com>
Message-ID: <20210719231835.0f31bbf1@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Mon, 19 Jul 2021 13:26:48 +0200
Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> Fixes:
> - https://release-monitoring.org/project/10714/
> 
> https://github.com/ibm-s390-linux/s390-tools/blob/v2.17.0/CHANGELOG.md
> 
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>

I've applied, with one minor change.

> +Subject: [PATCH 1/2] cpumf/lshwc: Fix compile errors due to use of
> + non-standard 32/64 bit types

We want [PATCH], not [PATCH X/Y] in the patches added to package/<pkg>/
folders. This is reported by "make check-package".

I fixed that up when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
