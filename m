From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 May 2016 15:20:43 +0200
Subject: [Buildroot] [PATCH v1 1/1] raptor: Patch to remove the support
 for blackfin architecture.
In-Reply-To: <1463057814-9991-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
References: <1463057814-9991-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
Message-ID: <20160512152043.68e8e85c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 May 2016 18:26:54 +0530, Atul Singh wrote:
> Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>

Why are you doing this? I.e, why do you want to disable raptor on the
Blackfin architecture ?

> ---
>  package/raptor/0002-remove-blackfin-support.patch | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 package/raptor/0002-remove-blackfin-support.patch

This patch is completely wrong. You're adding a patch to the Buildroot
raptor package, which will be applied on the raptor source code once
extracted by Buildroot.

This clearly indicates that you have not even tested this change.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
