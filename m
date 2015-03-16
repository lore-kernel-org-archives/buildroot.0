From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 16 Mar 2015 10:24:13 +0200
Subject: [Buildroot] [PATCH 2/2] ofono: bump to version 1.16
In-Reply-To: <1426493904-16521-2-git-send-email-petr.vorel@gmail.com>
References: <1426493904-16521-1-git-send-email-petr.vorel@gmail.com>
 <1426493904-16521-2-git-send-email-petr.vorel@gmail.com>
Message-ID: <20150316082413.GF2415@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr,

On Mon, Mar 16, 2015 at 09:18:24AM +0100, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/ofono/ofono.hash | 1 +
>  package/ofono/ofono.mk   | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  create mode 100644 package/ofono/ofono.hash
> 
> diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
> new file mode 100644
> index 0000000..e607ba5
> --- /dev/null
> +++ b/package/ofono/ofono.hash
> @@ -0,0 +1 @@
> +sha256	403b98dadece8bc804c0bd16b96d3db5a3bb0f84af64b3d67924da2d1a754b07  ofono-1.16.tar.xz

The convention in Buildroot is to add a comment in the .hash file with a 
reference to the source of the hash value. In this case it should be:

# From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
