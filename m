From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 11:04:31 +0200
Subject: [Buildroot] [PATCH] package/android-tools: fix static build
 failure due to missing -latomic
In-Reply-To: <ae6a0d68-1cca-e9f5-9de1-7e2a56be2e7e@micronovasrl.com>
References: <20190404153904.69693-1-giulio.benetti@micronovasrl.com>
 <20190404224539.2d79cf30@windsurf>
 <699842f1-d9e3-dd02-4770-e8a10499194b@micronovasrl.com>
 <e6f8db91-43e0-fc56-d071-1804616b2d61@micronovasrl.com>
 <20190408091820.2a7274a1@windsurf>
 <ae6a0d68-1cca-e9f5-9de1-7e2a56be2e7e@micronovasrl.com>
Message-ID: <20190408110431.734b346b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 8 Apr 2019 09:43:53 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> In this case, can I substitute "0005-fix-static-link-zlib.patch" with 
> the new one I'm going to create? I mean "0005-...patch" ?

Yes, sure.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
