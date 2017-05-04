From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 23:09:33 +0200
Subject: [Buildroot] [PATCH 1/2] package/nvidia-driver: bump version to
 381.09
In-Reply-To: <20170419123214.18835-1-bernd.kuhls@t-online.de>
References: <20170419123214.18835-1-bernd.kuhls@t-online.de>
Message-ID: <20170504230933.1a80f407@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Apr 2017 14:32:13 +0200, Bernd Kuhls wrote:
> libnvidia-egl-wayland.so was renamed in upstream archive.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Yann, could you comment on this patch?

Bernd, unfortunately, I can't download it from here:

thomas at skate:~/projets/buildroot (master)$ make nvidia-driver-extract
>>> nvidia-driver 381.09 Downloading
--2017-05-04 22:55:07--  ftp://download.nvidia.com/XFree86/Linux-x86/381.09/NVIDIA-Linux-x86-381.09.run
           => ?/home/thomas/projets/buildroot/output/build/.NVIDIA-Linux-x86-381.09.run.ZpEVbh/output?
Resolving download.nvidia.com (download.nvidia.com)... 192.229.220.191
Connecting to download.nvidia.com (download.nvidia.com)|192.229.220.191|:21... failed: Connection timed out.
Retrying.

--2017-05-04 22:57:15--  ftp://download.nvidia.com/XFree86/Linux-x86/381.09/NVIDIA-Linux-x86-381.09.run
  (try: 2) => ?/home/thomas/projets/buildroot/output/build/.NVIDIA-Linux-x86-381.09.run.ZpEVbh/output?
Connecting to download.nvidia.com (download.nvidia.com)|192.229.220.191|:21... failed: Connection timed out.
Retrying.

--2017-05-04 22:59:25--  ftp://download.nvidia.com/XFree86/Linux-x86/381.09/NVIDIA-Linux-x86-381.09.run
  (try: 3) => ?/home/thomas/projets/buildroot/output/build/.NVIDIA-Linux-x86-381.09.run.ZpEVbh/output?
Connecting to download.nvidia.com (download.nvidia.com)|192.229.220.191|:21... failed: Connection timed out.
Giving up.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
