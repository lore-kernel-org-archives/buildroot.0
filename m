From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 23:11:48 +0100
Subject: [Buildroot] [PATCH v2] package/optee-*: support
 BR2_STATIC_LIBS=y
In-Reply-To: <1552038909-21520-1-git-send-email-etienne.carriere@linaro.org>
References: <1552038909-21520-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <20190314231148.632ee544@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 Mar 2019 10:55:09 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Patch current optee-client 3.4.0 to support building resources
> with static linkage of executable binaries with the user libraries.
> The optee-client patch is under review in the OP-TEE project [1] and
> should be merged in the next OP-TEE release 3.5.0.
> 
> This change drops !BR2_STATIC_LIBS constraint on package optee-client
> and its dependent packages that are optee-benchmark, optee-examples,
> and optee-test.
> 
> [1] https://github.com/OP-TEE/optee_client/pull/147
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
> Changes v1 -> v2:
>   - Rebase to fix merge conflicts.
>   - Squash commit series for OP-TEE packages into a single change.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
