From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 23:35:16 +1300
Subject: [Buildroot] [PATCH v2 1/1] rpm: disable static build support
In-Reply-To: <20170109140817.10184-1-james.knight@rockwellcollins.com>
References: <20170109140817.10184-1-james.knight@rockwellcollins.com>
Message-ID: <20170124233516.2eadd994@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 Jan 2017 09:08:17 -0500, James Knight wrote:
> The RPM package requires dynamic linking support (dlfcn.h) for its
> capabilities related to plugins (and possibly more). The following
> commit adds a dependency to !BR2_STATIC_LIBS.
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
> Changes v1 -> v2:
>   - Cleanup commit message (suggested by Yann E. MORIN [1]).

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
