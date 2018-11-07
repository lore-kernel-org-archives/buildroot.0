From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Nov 2018 23:18:56 +0100
Subject: [Buildroot] [PATCH v2 1/1] fwts: Enable optional efi_runtime
 kernel module build
In-Reply-To: <1541419404-28044-1-git-send-email-sumit.garg@linaro.org> (Sumit
 Garg's message of "Mon, 5 Nov 2018 17:33:24 +0530")
References: <1541419404-28044-1-git-send-email-sumit.garg@linaro.org>
Message-ID: <87efbwa5v3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sumit" == Sumit Garg <sumit.garg@linaro.org> writes:

 > Firmware test suite does provides efi_runtime kernel module required
 > to run UEFI tests. So optionally enable this module build.

 > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
 > ---

 > Changes in v2:
 > 1. Keep efi_runtime config option inside if block.
 > 2. Remove linux dependency as $(kernel-module) takes care of this.
 > 3. Correct placement of config and $(kernel-module) blocks.

Committed after changing the -/_ inconsistency as suggested by Erico,
thanks.

-- 
Bye, Peter Korsgaard
