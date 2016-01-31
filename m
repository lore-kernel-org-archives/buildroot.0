From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 21:17:06 +0100
Subject: [Buildroot] [PATCH 1/1] RFC: musl: Fix gettext support
References: <1454194293-17572-1-git-send-email-bernd.kuhls@t-online.de>
 <20160131083325.73aab970@free-electrons.com>
Message-ID: <2n62ocx40l.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 31 Jan 2016 08:33:25 +0100 schrieb Thomas Petazzoni:

> I've looked at your patch, and I don't think it's such a hack.

Hi Thomas,

ftr, this patch can be reverted when a general solution for gettext/musl 
is found: https://git.busybox.net/buildroot/commit/package/madplay/
madplay.mk?id=a0a244d26d8e7e7e5465c3e6e9fcd1c31e2c178d

Madplay compiles without it using my patch.

Regards, Bernd
