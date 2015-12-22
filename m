From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 Dec 2015 12:52:44 +0200
Subject: [Buildroot] [PATCH] cantarell: bump to version 0.0.19
In-Reply-To: <1450781187-19894-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450781187-19894-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151222105244.GD1548@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Tue, Dec 22, 2015 at 07:46:27AM -0300, Gustavo Zacarias wrote:
>  CANTARELL_VERSION_MAJOR = 0.0
> -CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).18.1
> +CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).19
>  CANTARELL_SITE = http://ftp.gnome.org/pub/gnome/sources/cantarell-fonts/0.0

Unrelated to this patch, but the link should be 
http://ftp.gnome.org/pub/gnome/sources/cantarell-fonts/$(CANTARELL_VERSION_MAJOR). 
Otherwise there is no point in CANTARELL_VERSION_MAJOR at all.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
