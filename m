From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 18:43:39 +0200
Subject: [Buildroot] [PATCH 0/2] use host compressor for rootfs
In-Reply-To: <1396770501-9443-1-git-send-email-tremyfr@yahoo.fr>
References: <1396770501-9443-1-git-send-email-tremyfr@yahoo.fr>
Message-ID: <20140412184339.1f87a7da@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Philippe Reynes,

On Sun,  6 Apr 2014 09:48:19 +0200, Philippe Reynes wrote:
> When the rootfs is compressed with lzma, lzo or xz, we
> use the binary compiled by buildroot. But with gzip
> or bzip, we use the tools of the machine. This serie
> change this behaviour for gzip and bzip2, it add
> a dependancy on host-<compressor> and use it to
> compress the rootfs.
> 
> Philippe Reynes (2):
>   rootfs-gzip: use host-gzip instead of local gzip
>   rootfs-bzip: use host-bzip2 instead of local bzip2

Since the general reception about these patches has been fairly
negative, I've marked them as Rejected in patchwork.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
