From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 22:21:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/libdrm: amdgpu needs MMU
In-Reply-To: <20190311222630.17241-1-fontaine.fabrice@gmail.com>
References: <20190311222630.17241-1-fontaine.fabrice@gmail.com>
Message-ID: <20190312222141.26fd518d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Mar 2019 23:26:30 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> amdgpu test uses fork() so disable amdgpu without MMU
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8d6194982c1080e173fcef8212fb06e6dc275d58
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libdrm/Config.in                          | 1 +
>  package/mesa3d/Config.in                          | 2 ++
>  package/x11r7/xdriver_xf86-video-amdgpu/Config.in | 2 ++
>  3 files changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
