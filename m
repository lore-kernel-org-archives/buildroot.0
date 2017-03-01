From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 23:40:14 +0100
Subject: [Buildroot] [PATCH 1/1]
 package/x11r7/xdriver_xf86-video-vmware: fix compilation without udev
In-Reply-To: <20161218143246.30156-1-bernd.kuhls@t-online.de>
References: <20161218143246.30156-1-bernd.kuhls@t-online.de>
Message-ID: <20170301234014.319ba007@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Dec 2016 15:32:46 +0100, Bernd Kuhls wrote:
> https://cgit.freedesktop.org/xorg/driver/xf86-video-vmware/commit/configure.ac?id=755e38f373a511bd774a61c9420a67f630f71037
> added a check for libudev which fails if the check is not disabled.
> 
> Fixes
> http://autobuild.buildroot.net/results/7b3/7b38105dd1115ac622964cf243ac137b7624fb43/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk   | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks. Peter, this one could go to the LTS branch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
