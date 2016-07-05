From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 17:37:17 +0200
Subject: [Buildroot] [PATCH] apply-patches: catch unexpected failure
In-Reply-To: <1467716529-30183-1-git-send-email-romain.naour@gmail.com>
References: <1467716529-30183-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160705173717.54b84ba6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jul 2016 13:02:09 +0200, Romain Naour wrote:
> As reported by S?bastien Szymanski [1], the apply-patches script
> doesn't stop if a tar command can't extract an archive.
> 
> Use "set -e" to exit immediately if a command return an error.
> 
> [1] http://patchwork.ozlabs.org/patch/626196
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  support/scripts/apply-patches.sh | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
