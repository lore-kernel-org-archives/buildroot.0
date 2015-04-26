From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2015 23:28:19 +0200
Subject: [Buildroot] [PATCH 0/8 v11] NVidia GPU binary blobs for
 Tegra2/3 (branch yem/gfx2)
In-Reply-To: <20150426223152.7ed42fe5@free-electrons.com>
References: <cover.1429635674.git.yann.morin.1998@free.fr>
 <20150426223152.7ed42fe5@free-electrons.com>
Message-ID: <20150426212819.GH4809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-26 22:31 +0200, Thomas Petazzoni spake thusly:
> On Tue, 21 Apr 2015 19:04:39 +0200, Yann E. MORIN wrote:
> 
> > ----------------------------------------------------------------
> > Nicolas Serafini (3):
> >       package/nvidia-tegra23-binaries: new package
> >       package.nvidia-tegra23-binaries: add gstreamer plugins
> >       package/nvidia-tegra23-codecs: new package
> > 
> > Yann E. MORIN (5):
> >       package/xserver_xorg-server: prepare for multiple supported versions
> >       package/xserver_xorg-server: make the version a choice
> >       package/xserver_xorg-server: add blind options to specify driver ABI
> >       package/xserver_xorg-server: not all versions need all dependencies
> >       package/xserver_xorg-server: add version 1.14.7
> 
> Series applied!

Thanks! And thanks for further fixing it! :-)

/me can dump one more local branch! :-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
