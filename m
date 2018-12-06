From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:15:03 +0100
Subject: [Buildroot] [PATCH 1/1] eudev: fix build with kernel < 4.8
In-Reply-To: <20181205072530.23932-1-fontaine.fabrice@gmail.com>
References: <20181205072530.23932-1-fontaine.fabrice@gmail.com>
Message-ID: <20181206211503.0b9a715f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Dec 2018 08:25:30 +0100, Fabrice Fontaine wrote:
> KEY_ALS_TOGGLE has been added in kernel 4.8 with
> https://github.com/torvalds/linux/commit/9ee27487127461b5cf71670b708ed5b2b8da568c
> 
> So add it to missing.h to fix build with kernel older than 4.8
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0c0aff02df91cdb869efa01e397f7ccc0d9f69af
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../eudev/0002-missing.h-add-KEY_ALS_TOGGLE.patch  | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/eudev/0002-missing.h-add-KEY_ALS_TOGGLE.patch

Applied to master after updating the upstream status in the patch, now
that it has been merged upstream. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
