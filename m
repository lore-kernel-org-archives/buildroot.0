From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 15 Nov 2015 14:03:31 +0200
Subject: [Buildroot] [PATCH/next v2 1/4]
 package/x11r7/xdriver_xf86-video-intel: bump version
In-Reply-To: <1447588340-8270-1-git-send-email-bernd.kuhls@t-online.de>
References: <1447588340-8270-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151115120331.GH9908@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Nov 15, 2015 at 12:52:17PM +0100, Bernd Kuhls wrote:

> diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
> index 6c3c6ba..752a1ed 100644
> --- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
> +++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
> @@ -1,2 +1,2 @@
> -# From http://lists.x.org/archives/xorg-announce/2014-December/002508.html
> -sha256	00b781eea055582820a123c47b62411bdf6aabf4f03dc0568faec55faf9667c9	xf86-video-intel-2.99.917.tar.bz2
> +# From Locally computed
> +sha256	d5a6fd2f8599070294e60cd1168f3ffe71606ea07d9eaa4ed35f021396045563	xdriver_xf86-video-intel-0340718366d7cb168a46930eb7be22f2d88354d8.tar.gz

Hashes are not useful for arbitrary git checkouts. Should be:

none xxx xdriver_xf86-video-intel-0340718366d7cb168a46930eb7be22f2d88354d8.tar.gz

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
