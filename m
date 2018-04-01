From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 09:12:20 +0200
Subject: [Buildroot] [PATCH v2 20/37] Config.in*: fix attributes order
In-Reply-To: <20180401050850.5701-21-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-21-ricardo.martincoski@gmail.com>
Message-ID: <20180401091220.60f31a44@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:33 -0300, Ricardo Martincoski wrote:
> ... to follow the convention: type, default, depends on, select, help.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>   - no changes
> ---
>  Config.in        | 8 ++++----
>  Config.in.legacy | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
