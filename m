From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 22:13:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
In-Reply-To: <20170904185738.31182-1-bernd.kuhls@t-online.de>
References: <20170904185738.31182-1-bernd.kuhls@t-online.de>
Message-ID: <20170905221325.71f98014@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Sep 2017 20:57:38 +0200, Bernd Kuhls wrote:
> Add optional dependencies to
> 
> - libva
>   ffmpeg depends on libva, libva depends on xorg, so no need to add them
>   to _DEPENDENCIES

I don't see ffmpeg depending on libva, where do you see that ?

> - libtheora, libvorbis, libvpx, opus, x264, x265

You're doing more in this commit: you're removing libvpx as a mandatory
dependency, as well as x264.

It would be good to have a more descriptive commit log when the bump
isn't trivial.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
