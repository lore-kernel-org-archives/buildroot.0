From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 17:21:45 +0200
Subject: [Buildroot] [PATCH 1/1] fio: fix license
In-Reply-To: <20180909195023.23907-1-fontaine.fabrice@gmail.com>
References: <20180909195023.23907-1-fontaine.fabrice@gmail.com>
Message-ID: <20180910172145.5b42f890@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Sep 2018 21:50:23 +0200, Fabrice Fontaine wrote:
> fio does not have any special conditions since version 2.2.6 indeed
> MORAL-LICENSE has been updated to replace "promising" by "encouraged"
> and "must" by "should":
> https://github.com/axboe/fio/commit/67f4822ce3dc6af76b963c6ac467a8f0471a7faf
> 
> So fix LICENSE, add MORAL-LICENSE to LICENSE_FILES and add hash for both
> licenses
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fio/fio.hash | 2 ++
>  package/fio/fio.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
