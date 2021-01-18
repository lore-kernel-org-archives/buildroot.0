From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:23:01 +0100
Subject: [Buildroot] [PATCH] package/grpc: drop host gcc 4.8 workaround
In-Reply-To: <20210118094635.750975-1-buildroot@heine.tech>
References: <20210118094635.750975-1-buildroot@heine.tech>
Message-ID: <20210118222301.7a0a6339@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Jan 2021 10:46:33 +0100
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> Due to libabseil dependencies the host gcc is at least 4.9.
> So the fix for host gcc 4.8 is no longer needed.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/grpc/grpc.mk | 8 --------
>  1 file changed, 8 deletions(-)

Well spotted, applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
