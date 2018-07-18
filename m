From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 17:20:48 +0200
Subject: [Buildroot] [PATCH] cutelyst: new package
In-Reply-To: <20180718125949.04f926f8@windsurf>
References: <20180717204613.22028-1-dantti12@gmail.com>
 <20180718125949.04f926f8@windsurf>
Message-ID: <20180718172048.71b580e0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Daniel,

On Wed, 18 Jul 2018 12:59:49 +0200, Thomas Petazzoni wrote:

> Thanks for this new iteration. I applied it after doing some changes,
> which I'll describe below.

FYI, cutelyst fails to build when grantlee support is enabled:

  http://autobuild.buildroot.net/results/d84/d8467cdf9d12e606db39de45a19a3f62fdaf8ecc/build-end.log

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
