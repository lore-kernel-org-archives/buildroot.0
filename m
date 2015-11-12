From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 12 Nov 2015 22:14:21 +0100
Subject: [Buildroot] [PATCH 2/2] configs/qemu: bump to the latest linux
 version
In-Reply-To: <1447151972-12086-2-git-send-email-gustavo@zacarias.com.ar>
References: <1447151972-12086-1-git-send-email-gustavo@zacarias.com.ar>
 <1447151972-12086-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151112211421.GB21428@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,
Gustavo Zacarias wrote,

> sparc64_sun4u: ditch ne2k driver since it's useless, and add the e1000
> driver which works fine.

Thx, cool.

> x86: stick to 4.2.x kernels since 4.3 doesn't work right with uclibc
> (any variant) based toolchains.

Can you elaborate on this?
A quick build test worked fine for me.
Or did you had any runtime issues?

best regards
 Waldemar
