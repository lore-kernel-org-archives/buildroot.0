From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 19:25:50 +0200
Subject: [Buildroot] [PATCH v3 1/1] xserver_xorg-server: Fix race
 condition when installing man pages
In-Reply-To: <1402560585-10801-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402560585-10801-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140614192550.3c6c7a62@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 12 Jun 2014 10:09:45 +0200, Bernd Kuhls wrote:
> Reproduced the bug using BR2_JLEVEL=16
> 
> Fixes race condition by disabling parallel make in man/
> 
> http://autobuild.buildroot.net/results/11e/11ece737078ca8da2fee4249432148675b4e630e/
> http://autobuild.buildroot.net/results/a95/a952932b832ee3296d6c225c7a9df408ca3eef9f/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: To autoreconf host-xfont_font-util is needed
> v2: Patch man/Makefile.am to disable parallel make instead of removing man/
>     from SUBDIRS in Makefile.am

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
