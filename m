From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 09:09:45 +0200
Subject: [Buildroot] [PATCH v2 32/37] toolchain/*/Config.in: re-wrap
 help text
In-Reply-To: <20180401050850.5701-33-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-33-ricardo.martincoski@gmail.com>
Message-ID: <20180401090945.39b9a8a1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:45 -0300, Ricardo Martincoski wrote:
> ... to follow the convention <tab><2 spaces><62 chars>.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
> Changes v1 -> v2:
>   - rebase after toolchain-common.in was merged to Config.in
> ---
>  toolchain/Config.in                                           | 10 ++++++----
>  toolchain/toolchain-external/Config.in                        | 11 ++++++-----
>  .../toolchain-external-codescape-img-mips/Config.in           |  6 ++++--
>  .../toolchain-external-codescape-mti-mips/Config.in           |  6 ++++--
>  4 files changed, 20 insertions(+), 13 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
