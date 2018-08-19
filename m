From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Aug 2018 23:17:01 +0200
Subject: [Buildroot] [PATCH v3 1/1] Python3: Bump to 3.7.0
In-Reply-To: <SN6PR14MB21260D8517E2E6E173EE7582C7330@SN6PR14MB2126.namprd14.prod.outlook.com>
References: <20180817184607.27639-1-aduskett@gmail.com>
 <20180819155655.65466d16@windsurf>
 <SN6PR14MB21263CD05F33E8BEAAFC5A11C7330@SN6PR14MB2126.namprd14.prod.outlook.com>
 <SN6PR14MB21260D8517E2E6E173EE7582C7330@SN6PR14MB2126.namprd14.prod.outlook.com>
Message-ID: <20180819231701.66ece243@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 21:03:28 +0000, Adam Duskett wrote:

> I will investigate further tomorrow, however it seems that error can
> crop up if the tarball has pyc files in it. If you could check to see
> if vcversioner is bundled with pyc files, and if so remove them
> before building; that may solve the issue.

Already checked, the vcversioner tarball does not have .pyc files.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
