From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 09:22:55 +0100
Subject: [Buildroot] [PATCH 1/2] package/kodi: not available using a
 musl-based toolchain
In-Reply-To: <1453848286-2477-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453848286-2477-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160127092255.75c83958@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 26 Jan 2016 23:44:45 +0100, Bernd Kuhls wrote:
> The build stops with
> configure: error: unsupported host (i586-buildroot-linux-musl)
> due to musl not being supported in
> https://github.com/xbmc/xbmc/blob/Isengard/m4/xbmc_arch.m4
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

And what happens if you add an additional case to support musl ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
