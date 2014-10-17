From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 17 Oct 2014 23:39:32 +0200
Subject: [Buildroot] [PATCH v3 2/3] gst-ffmpeg: add --pkg-config to
	internal libav configure options
References: <1413142206-30581-1-git-send-email-danomimanchego123@gmail.com>
 <1413142206-30581-2-git-send-email-danomimanchego123@gmail.com>
 <20141017212453.GI3971@free.fr>
Message-ID: <XnsA3C9F0AB8CD30berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:20141017212453.GI3971 at free.fr:

> Instead of fixing just that one package, shouldn't we provide a symlink:
>     TUPLE-pkg-config  ->  pkg-config
> 
> This way, all packages that expect a cross-pkg-config will work without
> customisation.
> 
> Thomas, thoughts?

Hi,

I had the same idea back in January, but Thomas did not like it ;)
http://patchwork.ozlabs.org/patch/312273/

Regards, Bernd
