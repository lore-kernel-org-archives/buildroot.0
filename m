From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 14:37:28 +0200
Subject: [Buildroot] [PATCH] package/synergy: fix install when building
 in debug
In-Reply-To: <1490984484-18637-1-git-send-email-pieterjan.camerlynck@gmail.com>
References: <1490984484-18637-1-git-send-email-pieterjan.camerlynck@gmail.com>
Message-ID: <20170401143728.3335eaa5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Mar 2017 20:21:24 +0200, Pieterjan Camerlynck wrote:
> Synergy places it's executables in another location when building in
> debug. Patch CMakeLists.txt to disable the behavior.
> 
> Fixes:
> http://autobuild.buildroot.net/results/22d4d9a5d4363b1c9f3074f287b1383a366e0ce9
> 
> Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
> ---
>  ...change-output-path-when-building-in-debug.patch | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/synergy/0002-do-not-change-output-path-when-building-in-debug.patch

Applied to master, thanks. Could you submit this patch upstream?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
