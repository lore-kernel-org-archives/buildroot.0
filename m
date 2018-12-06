From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:07:45 +0100
Subject: [Buildroot] [PATCH] package/pps-tools: bump version to fix
 usage without bash
In-Reply-To: <20181203130354.15752-1-thomas.petazzoni@bootlin.com>
References: <20181203130354.15752-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181206220745.5236326d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Dec 2018 14:03:54 +0100, Thomas Petazzoni wrote:
> As report in bug #11426, the ppsfind shell script uses /bin/bash, but
> the Buildroot pps-tools package doesn't depend on bash. In fact,
> upstream has fixed the problem, and the script can now be used with a
> POSIX shell, and the shebang is /bin/sh.
> 
> This commit therefore bumps pps-tools to the latest upstream commit,
> which is precisely this fix.
> 
> Fixes bug #11426.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pps-tools/pps-tools.hash | 2 +-
>  package/pps-tools/pps-tools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
