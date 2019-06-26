From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Jun 2019 08:55:42 +0200
Subject: [Buildroot] [PATCH v4 08/15] package/gcc: switch to gcc 8.x as
 the default
In-Reply-To: <1892475d-542b-7c52-26c7-193f9749d347@mind.be>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-9-giulio.benetti@micronovasrl.com>
 <20190622214410.4bc6022e@windsurf>
 <29b577b0-8c65-7038-929b-ad2828ec7495@gmail.com>
 <20190623182145.459e0154@windsurf>
 <1892475d-542b-7c52-26c7-193f9749d347@mind.be>
Message-ID: <20190626085542.7c28499d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 Jun 2019 00:25:59 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > So on my side, green light to drop gdb 7.12.  
> 
>  For gdb, does it actually make sense to keep multiple versions?

I think it made sense for gdb 7.12 vs. gdb >= 8.x, due to this C++11
requirement on the host.

But if we are going to remove 7.12, then indeed, it probably no longer
makes sense to have a version choice.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
