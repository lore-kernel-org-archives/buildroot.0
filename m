From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 18:19:06 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/gcnano-binaries: Create
 directory before copy files
In-Reply-To: <20191125101426.10955-3-scooby22@web.de>
References: <20191125101426.10955-1-scooby22@web.de>
 <20191125101426.10955-3-scooby22@web.de>
Message-ID: <20191125181906.394b4075@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Nov 2019 11:14:26 +0100
Jens Kleintje <scooby22@web.de> wrote:

> The directory $(1)/usr/include may not exist before copy files.
> 
> Signed-off-by: Jens Kleintje <scooby22@web.de>
> ---
>  package/gcnano-binaries/gcnano-binaries.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
