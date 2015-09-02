From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 2 Sep 2015 07:54:40 +0300
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <1441148113-4894-1-git-send-email-yann.morin.1998@free.fr>
References: <1441148113-4894-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150902045440.GT17874@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Wed, Sep 02, 2015 at 12:55:13AM +0200, Yann E. MORIN wrote:
> systemd is incresaingly expected things to live in /usr/bin or
> /usr/sbin.

s/expected/expecting/

Can you be more specific? What actually breaks?

baruch

> 
> However, a lot of packages stil install stuff directly into /bin or
> /sbin.
> 
> Add an option so that /bin and /sbin be symlinks to /usr/bin and
> /usr/sbin. Ditto for .lib for consistency.
> 
> That option is forcibly enabled when the init system is systemd.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
