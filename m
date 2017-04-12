From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 22:59:30 +0200
Subject: [Buildroot] [PATCH v4 2/2] xenomai: Add config for
 enabling/disabling SMP
In-Reply-To: <20170410172603.6427-2-sikor6@gmail.com>
References: <20170410172603.6427-1-sikor6@gmail.com>
 <20170410172603.6427-2-sikor6@gmail.com>
Message-ID: <20170412225930.528726ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Apr 2017 19:26:03 +0200, Pawel Sikora wrote:
> Add a config option for enabling/disabling SMP
> in Xenomai userspace in version 3.x
> 
> Enabled by default.
> 
> Signed-off-by: Pawel Sikora <sikor6@gmail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changes v3 -> v4:
>   - No changes, just merging in series with 'core Cobalt/Mercury' patch

Applied to master after taking into account the comments made by Thomas
De Schampheleire.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
