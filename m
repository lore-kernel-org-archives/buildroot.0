From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 23:08:46 +0100
Subject: [Buildroot] [PATCH v3] package/lirc-tools: not available on musl
In-Reply-To: <1454705745-14979-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454705745-14979-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160205230846.46062ea7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri,  5 Feb 2016 21:55:45 +0100, Bernd Kuhls wrote:
> GLOB_BRACE is not supported by the musl libc:
> http://www.openwall.com/lists/musl/2013/09/16/1
> 
> Upstream correctly rejected the hack proposed by me:
> http://patchwork.ozlabs.org/patch/576188/
> http://sourceforge.net/p/lirc/tickets/174/#b087
> 
> Fixes
> http://autobuild.buildroot.net/results/603/603c4426c47220808305a416f3d60fec2d8c02a3/
> http://autobuild.buildroot.net/results/c08/c08abddeb5f0d0d1adec63ab4390562e3cfe1087/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: re-wrote the patch, lirc-tools is currently broken on musl (Arnout)
> v2: re-formatted patch and sent upstream (Thomas)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
