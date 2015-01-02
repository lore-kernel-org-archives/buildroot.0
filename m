From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 16:33:36 +0100
Subject: [Buildroot] [PATCH] openocd: add hash file
In-Reply-To: <1419801445-1405-1-git-send-email-vincent.stehle@laposte.net>
References: <20141228173148.5b1332bb@free-electrons.com>
 <1419801445-1405-1-git-send-email-vincent.stehle@laposte.net>
Message-ID: <20150102163336.53b2137c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent Stehl?,

On Sun, 28 Dec 2014 22:17:25 +0100, Vincent Stehl? wrote:
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> Cc: Peter Korsgaard <jacmet@sunsite.dk>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Claudio Laurita <claudio.laurita@integrazionetotale.it>
> ---
>  package/openocd/openocd.hash | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 package/openocd/openocd.hash

I've folded this patch into Claudio's bump of OpenOCD. Indeed, a hash
file for OpenOCD 0.5.0 was added in the mean time by Yann E. Morin to
fix download failures for packages downloaded from Sourceforge.

Patch marked as superseded in patchwork.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
