From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:26:43 +0100
Subject: [Buildroot] [PATCH v2] package/ti-cgt-pru: bump to 2.2.1
In-Reply-To: <20180109201306.13526-1-romain.naour@gmail.com>
References: <20180109201306.13526-1-romain.naour@gmail.com>
Message-ID: <20180112222643.1a67ffea@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Jan 2018 21:13:06 +0100, Romain Naour wrote:
> See: http://www.ti.com/tool/download/PRU-CGT-2-2
> 
> The ti-cgt-pru v2.1.x installer are affected by a bug with recent
> distribution (Fedora 27 and Ubuntu 17.10) using kernel 4.13 or 4.14
> with a glibc 2.26.
> The installer is stuck in a futex(wait) system call.
> 
> While at it, add license hash.
> 
> Fixes:
> http://autobuild.buildroot.net/results/68f/68f60ad38d9b6eae83b5d233966616a25d8c9391
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Ash Charles <ash.charles@savoirfairelinux.com>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Note: This bump is not tested on real PRU hardware.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
