From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 17:02:20 +0200
Subject: [Buildroot] [PATCH v3 00/11] Weston package enhancements
In-Reply-To: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160330170220.478079f1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Mar 2016 11:38:59 -0300, Gustavo Zacarias wrote:

> Gustavo Zacarias (11):
>   weston: add EGL support
>   weston: set default backend for fbdev
>   weston: add DRM compoitor support
>   weston: handle optional libva support
>   weston: add weston-launch support
>   weston: drop --disable-xwayland-test
>   weston: handle dbus dependency
>   weston: handle lcms dependecy
>   weston: handle webp dependency
>   weston: handle systemd dependency
>   weston: handle libxml2 dependency

I've applied all, but I have a few comments on a few of them, which
I'll do as reply to the patches themselves.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
