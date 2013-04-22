From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Apr 2013 17:56:43 +0200
Subject: [Buildroot] [PATCH 6/7] arc: Add support for ARC-specific uClibc
In-Reply-To: <1366630651-6857-7-git-send-email-mjonker@synopsys.com>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
 <1366630651-6857-7-git-send-email-mjonker@synopsys.com>
Message-ID: <20130422175643.230fc254@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Mon, 22 Apr 2013 13:37:30 +0200, Mischa Jonker wrote:
> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
> ---
>  toolchain/uClibc/Config.in                |   12 +-
>  toolchain/uClibc/uClibc-0.9.33-arc.config |  251 +++++++++++++++++++++++++++++

Do you really need a separate uClibc-<something>.config? I think we
really would like to avoid that if possible.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
