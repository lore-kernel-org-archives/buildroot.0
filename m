From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 May 2019 14:31:48 +0200
Subject: [Buildroot] [PATCH 0/8] fix GCC BUG 71124 and 85862
In-Reply-To: <20190522122542.84146-1-giulio.benetti@micronovasrl.com>
References: <20190522122542.84146-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190522143148.4f75cd0e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

On Wed, 22 May 2019 14:25:34 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Following 'Fix GCC BUG 85180 per-package' patchset:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=109024
> this patchset makes possible to build packages affected by GCC bugs 71124
> and 85862.

Is there any evidence that bug 71124 and 85180 are different ?

When there is an infinite loop when building a package on Microblaze,
how do you know if it's caused by gcc bug 71124 or gcc bug 85180 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
