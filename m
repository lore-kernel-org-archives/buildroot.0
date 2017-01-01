From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 01 Jan 2017 13:13:01 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: AIGLX
 Extension removed in 1.19.0
References: <20161231163037.13818-1-romain.naour@gmail.com>
 <vs2njdxqqd.ln2@ID-313208.user.individual.net>
 <6c8e7e25-e2e1-de2b-22fb-810395b4b470@gmail.com>
Message-ID: <db8njdxqqd.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 01 Jan 2017 12:50:45 +0100 schrieb Romain Naour:

> It seems that this new release of xserver is buggy with DRI2 and freeze
> some applications (even with my new Fedora 25).

Hi,

my initial patch to add 1.19.0 along with 1.18.4 was rejected:
http://patchwork.ozlabs.org/patch/699642/

> While testing lugaru package [1] with Enlightenment window manager, the
> game freeze quickly or even in the game menu.

The only X-based app, Kodi 17, I am building with buildroot works fine in 
fullscreen mode with xserver 1.19.0 & DRI2. Maybe because I am using the 
Intel xdriver in sna mode:
https://bugs.freedesktop.org/show_bug.cgi?id=98030#c9

Regards, Bernd
