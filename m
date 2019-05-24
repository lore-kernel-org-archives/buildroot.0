From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 23:18:59 +0200
Subject: [Buildroot] [PATCH v2 7/7] package/flashbench: remove old check
 if BR2_microblaze & BR2_sh2a
In-Reply-To: <20190522135906.30796-8-giulio.benetti@micronovasrl.com>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
 <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
 <20190522135906.30796-8-giulio.benetti@micronovasrl.com>
Message-ID: <20190524231859.380b11f3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 May 2019 15:59:06 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Commit:
> https://git.buildroot.net/buildroot/commit/?id=bad25aff36b70b55b34ea4580b45f657385ae9ac
> removed sourcery toolchain already deprecated in 2014 causing build
> failure. It was based on Gcc 4.6.2 and Buildroot doesn't use this
> anymore.

This explanation is quite fuzzy. What is the relationship between the
removal of those toolchains and this particular issue ? Also this
commit only removes Microblaze toolchains, not SH2A toolchains.

Since when the LLONG_MAX issue has been fixed ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
