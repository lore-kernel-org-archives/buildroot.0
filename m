From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 16:58:21 +0200
Subject: [Buildroot] [PATCH 1/1] libnfs: fix license
In-Reply-To: <20180922194442.28806-1-fontaine.fabrice@gmail.com>
References: <20180922194442.28806-1-fontaine.fabrice@gmail.com>
Message-ID: <20180923165821.2202926e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Sep 2018 21:44:42 +0200, Fabrice Fontaine wrote:
> As specified in COPYING, examples is licensed under GPL-3.0+ and .x
> files are licensed under BSD-2-Clause
> So update LIBNFS_LICENSE, add COPYING, LICENCE-BSD.txt and
> LICENCE-GPL-3.txt to LIBNFS_LICENSE_FILES and add hash for all
> license files
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libnfs/libnfs.hash | 4 ++++
>  package/libnfs/libnfs.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
