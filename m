From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 15:42:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/gcc: define _REENTRANT for
 OpenRISC when -pthread is passed
In-Reply-To: <20200327212305.2032057-1-bernd.kuhls@t-online.de>
References: <20200327212305.2032057-1-bernd.kuhls@t-online.de>
Message-ID: <20200329154248.4b5c21e0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 27 Mar 2020 22:23:05 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/ceb802eea0fee5812efd717ae4cdbd9673d9507e/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...TRANT-for-RISC-V-when-pthread-is-pas.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/gcc/9.3.0/0003-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
