From: Andreas Naumann <dev@andin.de>
Date: Wed, 19 Feb 2020 15:46:49 +0100
Subject: [Buildroot] [PATCH v6 00/28] Qt5 qmake infra and per-package
 compatibility
In-Reply-To: <20200218223353.09cdf837@gmx.net>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200218223353.09cdf837@gmx.net>
Message-ID: <83acad38-c76a-6fa1-dfe9-11d069e6d469@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Am 18.02.20 um 22:33 schrieb Peter Seiderer:
> Hello Andreas,
> 
> On Mon, 17 Feb 2020 22:23:22 +0100, Andreas Naumann <anaumann@ultratronik.de> wrote:
> 
> 
>> - qtwebengine locales appear in usr/translations/qtwebengine_locales/
>> instead of usr/translations/qtwebengine_locales/qtwebengine_locales/
> 
> And this perfect as the qtwebengine searches for locales *.pak files
> exactly under this location e.g.:
> 
> 	/usr/translations/qtwebengine_locales/en-US.pak
> 
> The double path is a buildroot qt5webengine package install mistake...,

That's what I'm saying. And the generic qmake infra would fix it.

regards,
Andreas

> patch fixing this will follow soon...
> 
> Regards,
> Peter
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
