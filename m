From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 23:03:29 +0100
Subject: [Buildroot] [PATCH] package/quickjs: depends on gcc 4.9 at least
In-Reply-To: <20201206063926.625756-1-francois.perrad@gadz.org>
References: <20201206063926.625756-1-francois.perrad@gadz.org>
Message-ID: <20201229230329.570cb579@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Dec 2020 07:39:26 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> fix build http://autobuild.buildroot.org/results/d45/d456eefffd138a714e367f9520adb662f5e0f57e/
> missing include <stdatomic.h>
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/quickjs/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
