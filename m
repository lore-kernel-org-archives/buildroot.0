From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 11:03:31 +0200
Subject: [Buildroot] [PATCH] network-manager: sync kernel headers
 comment with actual dependency
In-Reply-To: <20180630221915.448-1-thomas.petazzoni@bootlin.com>
References: <20180630221915.448-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180701110331.50944ca6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Jul 2018 00:19:15 +0200, Thomas Petazzoni wrote:
> In commit 52282828f06dc8aa3f721727f68a5096b9ed8b49
> ("package/network-manager: add patches to build with kernel headers
> 3.2"), network-manager was changed to build with kernel headers as old
> as 3.2, instead of 3.7 before. The dependency was changed accordingly,
> but the Config.in comment was not.
> 
> This commit fixes this inconsistency.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/network-manager/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
