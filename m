From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 23:14:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/nvidia-driver: bump version to
 381.09
In-Reply-To: <20170504230933.1a80f407@free-electrons.com>
References: <20170419123214.18835-1-bernd.kuhls@t-online.de>
 <20170504230933.1a80f407@free-electrons.com>
Message-ID: <20170504231422.51b06135@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 4 May 2017 23:09:33 +0200, Thomas Petazzoni wrote:

> Bernd, unfortunately, I can't download it from here:
> 
> thomas at skate:~/projets/buildroot (master)$ make nvidia-driver-extract
> >>> nvidia-driver 381.09 Downloading  
> --2017-05-04 22:55:07--  ftp://download.nvidia.com/XFree86/Linux-x86/381.09/NVIDIA-Linux-x86-381.09.run

Figured it out: using http:// instead of ftp:// fixes the issue. The
NVidia website points to http:// for downloading the drivers.

Fixed in
https://git.buildroot.org/buildroot/commit/?id=2068c7c6a810cdaf55240faf15c226ce3b308f1b

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
