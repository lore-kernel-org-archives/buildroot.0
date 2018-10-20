From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 20:14:56 +0200
Subject: [Buildroot] [PATCH 0/6] core: look for package's hashes in
 versioned sub-directory
In-Reply-To: <cover.1539519817.git.yann.morin.1998@free.fr>
References: <cover.1539519817.git.yann.morin.1998@free.fr>
Message-ID: <20181020201456.60160fbe@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Oct 2018 14:25:22 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (6):
>       core: add a variable that points to the package's hash file
>       legal-info: use the per-package variable to get the hash file
>       package: prepare for per-version hash files
>       core/download: do not hard-code the path to hte package hash file
>       package: drop unversioned hash files
>       docs/manual: document location of hash files for multi-versions packages

I've applied to master. However, there was an issue with "package:
prepare for per-version hash files", where the hashes for three Qt5
tarballs were inverted between the two versions. I fixed that up when
applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
