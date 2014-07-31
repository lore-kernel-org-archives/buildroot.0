From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 23:50:47 +0200
Subject: [Buildroot] [PATCH v2] Add option to copy config file to rootfs
In-Reply-To: <1406820398-2105-1-git-send-email-nroach44@gmail.com>
References: <1406820398-2105-1-git-send-email-nroach44@gmail.com>
Message-ID: <20140731235047.5b95e826@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nathaniel Roach,

On Thu, 31 Jul 2014 23:26:38 +0800, Nathaniel Roach wrote:
> BR2_CONFIG_COPY copies the config file to /etc/buildroot.config
> as 0600 during target-finalize after overlay copy, but before
> post-build script install.
> 
> ---
> Changes v1 to v2
>  - Corrected wording of config helper message (Thomas De Schampheleire)
>  - Moved order in menu to reflect actual order of the operation
> ---
>  Makefile         |  4 ++++
>  system/Config.in | 11 +++++++++++
>  2 files changed, 15 insertions(+)

Thanks for the proposal, but apparently there's no really a consensus
around it and there's a very simple way to do the same using a
post-build script, so I've marked the patch as Rejected in patchwork.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
