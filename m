From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 21:39:16 +0200
Subject: [Buildroot] [PATCH v4 04/15] toolchain: add gcc 9 entry
In-Reply-To: <20190620100725.105587-5-giulio.benetti@micronovasrl.com>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-5-giulio.benetti@micronovasrl.com>
Message-ID: <20190622213916.5e070e17@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Jun 2019 12:07:14 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> From: Romain Naour <romain.naour@gmail.com>
> 
> In order to add gcc 9 support for internal and external toolchain in
> follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_9 symbol.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  toolchain/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
