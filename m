From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 22:58:06 +0200
Subject: [Buildroot] [PATCH v2] mpv: jack/sdl/sdl2 require 64-bit sync
 intrinsics
In-Reply-To: <1461849618-3622-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461849618-3622-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160505225806.656937d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Apr 2016 10:20:18 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/578/578beb2f3b34fc83109e79d8db7de7219dd8340e/
> http://autobuild.buildroot.net/results/21c/21ce67041792d29082f5bba76299da19dd1856eb/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> Change for v2: drop testing static kludges

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
