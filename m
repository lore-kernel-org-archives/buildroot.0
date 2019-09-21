From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Sep 2019 22:57:25 +0200
Subject: [Buildroot] [PATCH 1/2] package/pulseaudio: bump version to 13.0
In-Reply-To: <20190920172538.1635-1-bernd.kuhls@t-online.de>
References: <20190920172538.1635-1-bernd.kuhls@t-online.de>
Message-ID: <20190921225725.247dba0c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 20 Sep 2019 19:25:37 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/13.0/
> 
> Support for bluez4 was removed upstream:
> https://cgit.freedesktop.org/pulseaudio/pulseaudio/commit/?id=3b1093c0ad882640ef7cf2b88088d77988be7610
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/pulseaudio/pulseaudio.hash | 4 ++--
>  package/pulseaudio/pulseaudio.mk   | 9 +--------
>  2 files changed, 3 insertions(+), 10 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
