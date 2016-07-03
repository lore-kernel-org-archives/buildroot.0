From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 01:11:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: Fix pthread
 detection on bfin and arc
In-Reply-To: <1465846126-19316-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465846126-19316-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160704011117.6b276c92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Jun 2016 21:28:46 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/593/593b5050473a83a9ddcada9de39f8f14ab38d554/
> http://autobuild.buildroot.net/results/ff0/ff058a378b91740b5b399f32a6b375fbc3c8df06/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Since Peter was not too happy about your proposal, I submitted a
different one, at http://patchwork.ozlabs.org/patch/634835/, which
consists in defining _REENTRANT on Blackfin and ARC, to compensate for
the compiler bug.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
