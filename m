From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 15:27:39 +0200
Subject: [Buildroot] [PATCH] package/network-manager: bump to version
 1.20.2
In-Reply-To: <20190906092553.2610490-1-lkundrak@v3.sk>
References: <20190906092553.2610490-1-lkundrak@v3.sk>
Message-ID: <20190907152739.636c8b18@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Sep 2019 11:25:53 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> A straightforward bump. Tested.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  package/network-manager/network-manager.hash | 4 ++--
>  package/network-manager/network-manager.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks. While reviewing this patch, I noticed the
COPYING file of NetworkManager only has the GPL-2.0 license text, even
though a large part of NetworkManager is under LGPL-2.0, as explained
by the "Legal" section in CONTRIBUTING.

Perhaps it would be useful to include the LGPL-2.0 license text as
well ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
