From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 23:16:06 +0200
Subject: [Buildroot] [PATCH 1/3] sdl2_mixer: new package
In-Reply-To: <20170522131307.27529-1-francois.perrad@gadz.org>
References: <20170522131307.27529-1-francois.perrad@gadz.org>
Message-ID: <20170531231606.588fc2ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 May 2017 15:13:05 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                  |  1 +
>  package/sdl2_mixer/Config.in       | 11 +++++++++++
>  package/sdl2_mixer/sdl2_mixer.hash |  2 ++
>  package/sdl2_mixer/sdl2_mixer.mk   | 40 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 54 insertions(+)
>  create mode 100644 package/sdl2_mixer/Config.in
>  create mode 100644 package/sdl2_mixer/sdl2_mixer.hash
>  create mode 100644 package/sdl2_mixer/sdl2_mixer.mk

You forgot to add an entry to the DEVELOPERS file, so I've done that
and applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
