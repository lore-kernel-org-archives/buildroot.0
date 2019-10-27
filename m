From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Oct 2019 15:59:24 +0100
Subject: [Buildroot] [PATCH v3 1/4] boot/arm-trusted-firmware: support
 alternate image files
In-Reply-To: <20190322095818.19914-1-etienne.carriere@linaro.org>
References: <20190322095818.19914-1-etienne.carriere@linaro.org>
Message-ID: <d3607755-73d7-f001-8726-cb6c1ce6e67f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/03/2019 10:58, Etienne Carriere wrote:
> Some platform may generate specific boot image files instead of
> the generic files *.bin  when building TF-A package.

 This is still very vague, and it doesn't have any in-tree user. Therefore,
we're not prepared to merge this patch. Do you have a concrete example,
preferably with a defconfig that actually makes use of it?

 I've therefore marked this patch as Changes Requested.

 Regards,
 Arnout

> This change
> introduces new configuration directive for the arm-trusted-firmware
> boot package.
> 
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_IMAGE_NAMES is boolean.
> When disabled, install boot image files are .../*.bin.
> When enabled, BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL_IMAGE_NAMES shall
> lists the names of the generated boot image files.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
[snip]
