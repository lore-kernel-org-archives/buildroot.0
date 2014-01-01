From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 1 Jan 2014 22:57:44 +0200
Subject: [Buildroot] [PATCH 1/1] ffmpeg: bump to version 1.2.4
In-Reply-To: <BLU0-SMTP388FBD53FB4E0021AEAB1ACD9C80@phx.gbl>
References: <BLU0-SMTP388FBD53FB4E0021AEAB1ACD9C80@phx.gbl>
Message-ID: <20140101205744.GE6589@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Wed, Jan 01, 2014 at 09:39:10PM +0100, Bernd Kuhls wrote:
> Compile tested the following packages which depend on ffmpeg:
> 
> freerdp
> mpd
> gstreamer
> 
> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>

[...]

> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +FFMPEG_CONF_OPT += -enable-openssl

You need double dash before 'enable-openssl'.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
