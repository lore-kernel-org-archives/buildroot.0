From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 May 2019 21:13:29 +0200
Subject: [Buildroot] [PATCH v2 5/7] package/ecryptfs-utils: allow
 building with GCC_BUG_85862 and on Microblaze
In-Reply-To: <77c2dccf-73ae-a78f-c0d8-28842e103440@micronovasrl.com>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
 <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
 <20190522135906.30796-6-giulio.benetti@micronovasrl.com>
 <77c2dccf-73ae-a78f-c0d8-28842e103440@micronovasrl.com>
Message-ID: <20190527211329.18c6678c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 May 2019 19:28:32 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> I've seen you've tagged this as Changes Requested:
> https://patchwork.ozlabs.org/patch/1103358/
> 
> It is because of dependency to "keyutils" still not fixed right?

Because this patch depends on the libnss patch, which was also marked
as Changes Requested.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
