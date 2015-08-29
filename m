From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 23:20:12 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/tvheadend: needs dynamic
 libraries
In-Reply-To: <1440855392-3323-1-git-send-email-bernd.kuhls@t-online.de>
References: <1440855392-3323-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150829232012.5ab33602@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 29 Aug 2015 15:36:32 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/f1c/f1c40ac9dda5ceeb5665d021333058eb29828d62/
> http://autobuild.buildroot.net/results/bd0/bd0e8619df7cd8f21da96ae470691b1ebb2f156c/
> http://autobuild.buildroot.net/results/f1c/f1c40ac9dda5ceeb5665d021333058eb29828d62/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v4: tvheadend depends on dladdr() and needs dynamic libraries (Thomas, Yann)
> v3: Changed patch to fix Makefile instead (Thomas)
> v2: Put everything in the if-static_libs-then clause (Jerzy)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
