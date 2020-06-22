From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 22:44:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/gptfdisk: fix build with ncurses
In-Reply-To: <20200622192828.291026-1-fontaine.fabrice@gmail.com>
References: <20200622192828.291026-1-fontaine.fabrice@gmail.com>
Message-ID: <20200622224409.2cd27a9c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Jun 2020 21:28:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/8d15d2a6ac25164bc79749bd9e6fd87adb45a08a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...lly-revert-Tweaks-for-building-on-th.patch | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
