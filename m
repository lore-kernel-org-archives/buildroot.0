From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 7 Dec 2014 05:23:17 +0200
Subject: [Buildroot] [PATCH v2] package/libnss: need dynamic library
 support
In-Reply-To: <1417879919-17986-1-git-send-email-s.martin49@gmail.com>
References: <1417879919-17986-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20141207032317.GA2440@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Sat, Dec 06, 2014 at 04:31:59PM +0100, Samuel Martin wrote:
> @@ -15,6 +16,7 @@ config BR2_PACKAGE_LIBNSS
>  
>  	  http://www.mozilla.org/projects/security/pki/nss/
>  
> -comment "libnss needs a toolchain w/ largefile, threads"
> +comment "libnss needs a toolchain w/ largefile, threads, dynamic librairy"

s/librairy/library/

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
