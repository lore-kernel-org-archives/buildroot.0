From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Tue, 18 Feb 2014 09:40:00 +0100
Subject: [Buildroot] ipv6 and eglibc
Message-ID: <53031C60.6020803@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I'm trying to add the postgres package, starting with this hints:

http://www.slideshare.net/jerome42/create-lightweight-docker-containers-with-buildroot

I'm using the eglibc in order to enable the eglsf support for Qt5.
Postgresql requires the BR2_TOOLCHAIN_BUILDROOT_INET_IPV6.

Searching for this keyword I see this:

Symbol: BR2_TOOLCHAIN_BUILDROOT_INET_IPV6 [=n] ?
Type : boolean
Prompt: Enable IPv6 support
Location:
-> Toolchain
Defined at package/uclibc/Config.in:70
Depends on: BR2_TOOLCHAIN_BUILDROOT [=y] && 
BR2_TOOLCHAIN_BUILDROOT_UCLIBC [=n]
Selects: BR2_INET_IPV6 [=y] ?

I guess because I'm using eglibc instead of uclibc.

I have no knowledge to decide what I should do now....
Thank you for your support!
Marco
