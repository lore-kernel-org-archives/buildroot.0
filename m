From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jan 2018 22:58:59 +0100
Subject: [Buildroot] [PATCH] aoetools: fix aoe-stat script that was
 using /bin/bash in its shebang
In-Reply-To: <1516970642-9098-1-git-send-email-sergio.prado@e-labworks.com>
References: <1516970642-9098-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20180130225859.770e845d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Jan 2018 10:44:02 -0200, Sergio Prado wrote:
> This will make the script more portable, making it possible to run on
> systems that do not have bash.
> 
> The script was tested with ash from BusyBox and checked for portability
> issues and bashisms with shellcheck and checkbashisms tools.
> 
> The patch was already applied upstream [1] and should be removed in the
> next version bump.
> 
> [1] https://github.com/OpenAoE/aoetools/commit/4ef42740538cefd3c1554aa4df5bcb1388ac927b
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  ...l-script-interpreter-from-bin-bash-to-bin.patch | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/aoetools/0001-Change-shell-script-interpreter-from-bin-bash-to-bin.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
