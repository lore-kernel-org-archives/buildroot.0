From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 20:54:08 +0200
Subject: [Buildroot] [PATCH 2/4] toolchain: bug 90620 has not been fixed
 in gcc 8.x
In-Reply-To: <20190618084535.75870-3-giulio.benetti@micronovasrl.com>
References: <20190618084535.75870-1-giulio.benetti@micronovasrl.com>
 <20190618084535.75870-3-giulio.benetti@micronovasrl.com>
Message-ID: <20190622205408.41ea0cff@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Jun 2019 10:45:33 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Gcc bug 90620 appears on gcc 8.x so remove version check dependency and
> keep only the BR2_microblaze one.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  toolchain/Config.in | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
