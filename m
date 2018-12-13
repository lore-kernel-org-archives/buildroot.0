From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 22:33:26 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/swupdate: Update to version
 2018.11
In-Reply-To: <20181212142056.7722-1-jared.bents@rockwellcollins.com>
References: <20181212142056.7722-1-jared.bents@rockwellcollins.com>
Message-ID: <20181213223326.7f1486c2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Dec 2018 08:20:56 -0600, Jared Bents wrote:
> Update to version 2018.11 to resolve build errors due to the changes
> in libcurl at version 7.62.0
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> --
> [v1->v2]: Update to add COPYING to hash file
> 
> ---
>  package/swupdate/swupdate.hash | 3 ++-
>  package/swupdate/swupdate.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to master after extending the commit log to give more details
about the build issue.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
