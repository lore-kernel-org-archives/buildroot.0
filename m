From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 08 Mar 2021 22:59:34 +0100
Subject: [Buildroot] [PATCH 00/12 v8] Introduce libudev (branch
 yem/libudev-4)
References: <cover.1468274498.git.yann.morin.1998@free.fr>
 <20160716154736.19dd42fb@free-electrons.com> <20160718175241.GA3738@free.fr>
Message-ID: <6bjihhxnm.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 18 Jul 2016 19:52:41 +0200 schrieb Yann E. MORIN:

> Bernd has a (imho, valid) use-case about using only libudev without a
> udev daemon altogether; there *are* other similar cases.

Hi Yann,

years later there is a new solution for this problem: libudev-zero

Here is a hackish patch for buildroot which I am using with Kodi 19/gbm/
OpenGLES/no_X11 to provide udev support for libinput:

https://github.com/bkuhls/buildroot/commit/
ba49d2a8f9bb9879373d17711b82adfe867f4bdc

What about adding libudev-zero to buildroot?

Regards, Bernd
