From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Feb 2019 23:08:00 +0100
Subject: [Buildroot] [PATCH v4 5/7] optee-benchmark: new package
In-Reply-To: <1548845249-28201-5-git-send-email-etienne.carriere@linaro.org>
References: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
 <1548845249-28201-5-git-send-email-etienne.carriere@linaro.org>
Message-ID: <20190217230800.6206adaa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Jan 2019 11:47:27 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> OP-TEE performance benchmark tools for the OP-TEE project.
> 
> This packages generates embedded Linux based OS materials used
> to retrieve execution timing information on invocation of the
> OP-TEE secure services.
> 
> It is added next to the OP-TEE client package in BR configuration.
> 
> This change references in Buildroot the today's latest OP-TEE
> revision release tagged 3.4.0.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> 
> ---
> Changes v3 -> v4:
>   - Upgrade from OP-TEE release 3.3.0 to 3.4.0. No local patch required.

I have applied to next with the following changes:

    [Thomas:
     - drop version selection
     - propagate the dependency of optee-client]

Another thing I noticed is that your .hash files do not have the hashes
for the license files. Could you send a patch adding those ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
