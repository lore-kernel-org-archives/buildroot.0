From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Nov 2013 08:57:14 +0100
Subject: [Buildroot] [PATCH v3 1/1] Avoid toolchain download when it is
 preinstalled
In-Reply-To: <527A962E.4090402@gezedo.com>
References: <527A962E.4090402@gezedo.com>
Message-ID: <20131107085714.0046eb1e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Laurent GONZALEZ,

On Wed, 06 Nov 2013 20:19:10 +0100, Laurent GONZALEZ wrote:
> For configurations using a toolchain that is preinstalled on
> the host, <pkg>_SITE and <pkg>_SOURCE variables must be kept
> empty to avoid downloading any toolchain package.
> The actual implementation has been proposed by Thomas Petazzoni.
> 
> Signed-off-by: GONZALEZ Laurent <br2@gezedo.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk |    8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
