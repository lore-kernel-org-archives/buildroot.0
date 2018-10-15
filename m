From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Oct 2018 21:28:21 +0200
Subject: [Buildroot] [PATCH v2] package/glibc: provide an upstream site
 link
In-Reply-To: <1539616474-34656-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1539616474-34656-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20181015212821.467512ad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Oct 2018 10:14:34 -0500, Matt Weber wrote:
> The Config.in for glibc is a blind option and not part of the menu for
> a user to select (the pkg is used for the Buildroot toolchain build),
> however this patch adds the link for completeness of the pkg-stats
> report and for future scripting which will generate xml updates of the
> package's Common Product Enumeration (used for vunerability checking).
> 
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes
> v1 -> v2
> [Thomas
>  - Add a better description to the commit as a user will never use
>    kconfig to view this help message.
> ---
>  package/glibc/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
