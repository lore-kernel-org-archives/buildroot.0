From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 10:15:21 +0200
Subject: [Buildroot] [PATCH v2 24/37] package/*/Config.in: fix
 attributes order
In-Reply-To: <20180401050850.5701-25-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-25-ricardo.martincoski@gmail.com>
Message-ID: <20180401101521.7d4b8e3e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:37 -0300, Ricardo Martincoski wrote:
> ... to follow the convention: type, default, depends on, select, help.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>   - no changes
> ---
>  package/mono/Config.in    | 2 +-
>  package/php/Config.in     | 8 ++++----
>  package/systemd/Config.in | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
