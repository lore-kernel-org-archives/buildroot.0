From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 20:39:35 +0200
Subject: [Buildroot] [PATCH v5 2/2] package/rng-tools: bump to 6.7
In-Reply-To: <20191022181732.38981-2-matthew.weber@rockwellcollins.com>
References: <20191022181732.38981-1-matthew.weber@rockwellcollins.com>
 <20191022181732.38981-2-matthew.weber@rockwellcollins.com>
Message-ID: <20191022203935.01144885@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Oct 2019 13:17:32 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> * Switch to new site and add license file hash
> * Add new libsysfs dependency for rng available check
> * Remove patch adding special return code when no RNG module is available.
>   This has been replaced by using the jitter library to always have a
>   source (new jitterentropy dependency)
> * Change to a autotools build and add patch to allow README file to not be
>   found during autoreconfig
> 
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Tested-by: Romain Naour <romain.naour@smile.fr>
> 
> ---
> Changes
> v5
> [Matt
>  - Added missing host-pkgconf dependency found on a fresh build.
>     Fixes: "possibly undefined macro: AC_MSG_ERROR"

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
