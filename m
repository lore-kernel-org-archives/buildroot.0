From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 May 2021 22:09:31 +0200
Subject: [Buildroot] [PATCH v3 3/4] lmbench: emulate --prefix to avoid
 scattering binaries all over
In-Reply-To: <20210510180049.61421-5-vgupta@synopsys.com>
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-5-vgupta@synopsys.com>
Message-ID: <20210510220931.1dc78bde@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 May 2021 11:00:48 -0700
Vineet Gupta via buildroot <buildroot@busybox.net> wrote:

>  - moves all lmbench binaries to <target>/lmbench/bin/<ARCH>
>  - scripts copied to <target>/lmbench/scripts
>  - scripts/os overwritten to setup "OS" as expected by LMBench runtime scripts
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

Where are lmbench binaries currently installed? Because /lmbench/ looks
really really odd as an installation location.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
