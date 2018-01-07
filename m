From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 07 Jan 2018 18:57:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXpm: needs
 host-gettext
References: <20170822170304.7160-1-bernd.kuhls@t-online.de>
 <20170822230152.40dab192@windsurf>
Message-ID: <el3aiexcto.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 22 Aug 2017 23:01:52 +0200 schrieb Thomas Petazzoni:

> Hello,
> 
> On Tue, 22 Aug 2017 19:03:04 +0200, Bernd Kuhls wrote:
>> https://git.buildroot.net/buildroot/commit/package/x11r7?
id=e398ec92e9ad04e5bbae32f03cd18a53b5761517
>> removed the host-gettext dependency. Since then building the package
>> fails on hosts without the xgettext binary:
>> 
>> /bin/sh: xgettext: command not found

Hi,

superseded by http://patchwork.ozlabs.org/patch/856573/

Regards, Bernd
