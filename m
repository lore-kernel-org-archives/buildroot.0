From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:04:28 +0200
Subject: [Buildroot] [PATCH 1/2] phytool: new package
In-Reply-To: <20170412121634.8928-1-yegorslists@googlemail.com>
References: <20170412121634.8928-1-yegorslists@googlemail.com>
Message-ID: <20170412210428.28c10479@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Apr 2017 14:16:33 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in            |  1 +
>  package/phytool/Config.in    |  6 ++++++
>  package/phytool/phytool.hash |  2 ++
>  package/phytool/phytool.mk   | 22 ++++++++++++++++++++++
>  4 files changed, 31 insertions(+)
>  create mode 100644 package/phytool/Config.in
>  create mode 100644 package/phytool/phytool.hash
>  create mode 100644 package/phytool/phytool.mk

Following Arnout comments, I've marked your patch as Changes Requested
in patchwork. Also, please merge PATCH 2/2 into PATCH 1/2, the change
to the DEVELOPERS should now be done in the patch adding the package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
