From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 18:51:40 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: reduce number of mkdir calls
 in inittab
In-Reply-To: <20180605134709.24381-1-F.LaRoche@pilz.de>
References: <20180605134709.24381-1-F.LaRoche@pilz.de>
Message-ID: <20180605185140.3997112e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Jun 2018 15:47:09 +0200, Florian La Roche wrote:
> The default busybox inittab does two separate mkdir calls
> to create /dev/pts and /dev/shm. Reduce this to call mkdir
> only once for both directories.
> 
> Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
> ---
>  package/busybox/inittab | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
