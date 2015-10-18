From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 18 Oct 2015 15:21:22 +0300
Subject: [Buildroot] [PATCH v2 2/2] package/kodi-screensaver-rsxs: new
 package
In-Reply-To: <1445170286-12871-2-git-send-email-bernd.kuhls@t-online.de>
References: <1445170286-12871-1-git-send-email-bernd.kuhls@t-online.de>
 <1445170286-12871-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151018122122.GI20889@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Oct 18, 2015 at 02:11:26PM +0200, Bernd Kuhls wrote:
> Also remove options BR2_PACKAGE_XLIB_XMU and BR2_PACKAGE_XLIB_XMU as

Should be 'BR2_PACKAGE_XLIB_XMU and BR2_PACKAGE_XLIB_XT ...'.

> well, they are not needed and never worked anyway due to typos ;)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
