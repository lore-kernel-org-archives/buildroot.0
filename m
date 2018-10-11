From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 10:19:33 +0200
Subject: [Buildroot] [PATCH 0/6] core: look for package's hashes in
 versioned sub-directory
In-Reply-To: <cover.1538913431.git.yann.morin.1998@free.fr>
References: <cover.1538913431.git.yann.morin.1998@free.fr>
Message-ID: <20181011101933.29018f49@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Oct 2018 13:57:19 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (6):
>       core: add a variable that points to the package's hash file
>       legal-info: use the per-package variable to get the hash file
>       package/qt5: prepare for per-version hash files
>       core/download: do not hard-code the path to hte package hash file
>       package/qt5: drop unversioned hash files
>       docs/manual: document location of hash files for multi-versions packages

This looks good to me. When applying, we will have to adjust the glibc
package as well, which now uses per-version hash files as well, but
no need to resend for that.

If nobody complains by tomorrow, I'll apply this patch series.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
