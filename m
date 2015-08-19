From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Wed, 19 Aug 2015 07:00:43 +0300 (IDT)
Subject: [Buildroot] Web user interface for Buildroot
In-Reply-To: <55D3C27E.9000500@mail.bg>
References: <55D3C27E.9000500@mail.bg>
Message-ID: <alpine.DEB.2.02.1508190647370.26165@orcam81.orcam.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nikolay,
See reply below ...

On Wed, 19 Aug 2015, Nikolay Dimitrov wrote:

> Date: Wed, 19 Aug 2015 02:40:46 +0300
> From: Nikolay Dimitrov <picmaster@mail.bg>
> To: buildroot at busybox.net
> Subject: [Buildroot] Web user interface for Buildroot
> 
> Hi guys,
>
> Is there a buildroot package which implements a web-based GUI for
> managing the device's network configuration, something like openwrt's
> luci?
>
> Thanks in advance. Regards,
> Nikolay
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

By design, Buildroot isn't a Linux distribution like OpenWRT or Debian, so 
it doesn't have it's own userspace tools for system configuration. In 
fact, Buildroot isn't necessarily for Linux only, although most 
applications that use Buildroot are in fact Linux-based.

The Buildroot design goals are modest. The idea is to provide knowledgeable 
users with a simple system for building a root filesystem using popular 
Open Source packages. That's it, nothing more than that! By design.

Best regards,

  - yba


-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
