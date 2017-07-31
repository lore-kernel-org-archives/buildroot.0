From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 23:03:39 +0200
Subject: [Buildroot] [PATCH v2 1/1] qt5declarative: backport 'Fix
 alignment issue on ARMv7' patch to 5.9.1
In-Reply-To: <20170731203206.17875-1-petar.koretic@qaap.io>
References: <20170731203206.17875-1-petar.koretic@qaap.io>
Message-ID: <20170731230339.2d5d3db0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Jul 2017 22:32:06 +0200, Petar Koretic wrote:
> This resolves a QML issues reported in
> https://bugreports.qt.io/browse/QTBUG-61522 that will be fixed in the
> 5.9.2.
> 
> Signed-off-by: Petar Koretic <petar.koretic@qaap.io>
> ---
> v2:
>  - add patch to 5.9.1 subfolder
>  - add missing bug report link and Signed-off-by to upstream patch

Applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
