From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Aug 2019 14:59:43 +0200
Subject: [Buildroot] [PATCH v6 07/10] package/mesa3d: add a new option
 to enable GLX support
References: <20190804185417.6562-1-bernd.kuhls@t-online.de>
 <20190804185417.6562-7-bernd.kuhls@t-online.de>
 <CAK4VdL2Vw4stKEJA6Tyg4mGT=uBJxt00qitwh=JZcDQo=cFYhg@mail.gmail.com>
 <3or42gxeq6.ln2@ID-313208.user.individual.net>
 <ff8c9c3b-6ddf-462c-51a8-c12270714c20@gmail.com>
 <92852gxeq6.ln2@ID-313208.user.individual.net>
 <f0ce5c09-d773-a39d-30a0-48822398a942@gmail.com>
Message-ID: <v2g52gxeq6.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 11 Aug 2019 13:24:34 +0200 schrieb Romain Naour:

> Lima and panfrost are Gallium drivers that can be used as kmsro.

Hi Romain,

sent v8 for the -next branch:
http://patchwork.ozlabs.org/project/buildroot/list/?series=124438

including the panfrost driver and selecting ksmro for lima.

I will prepare a rebased Kodi 18-bump series (not as RFC ;)) soon, maybe 
it can be included in the -next branch to iron out problems until 2019.11?

Regards, Bernd
