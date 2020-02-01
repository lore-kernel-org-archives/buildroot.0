From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 01 Feb 2020 21:00:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: use github helper for
 KODI_EXTRA_DOWNLOADS
References: <20200201141459.1762745-1-bernd.kuhls@t-online.de>
 <20200201171552.3f3e6bff@windsurf>
Message-ID: <nv1hggxcc9.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sat, 01 Feb 2020 17:15:52 +0100 schrieb Thomas Petazzoni:

>> -# Locally computed - ffmpeg -sha256
>> e11e7594af35f36ab2711252c3d6bb106908f26605498aef4a9be2d7bc001db2 
>> 4.0.4-Leia-18.4.tar.gz
> 
> Hum, if I'm correct, removing this hash is not related to the change in
> this commit.

it is related, the tarball is now called kodi-ffmpeg-4.0.4-
Leia-18.4.tar.gz.

> Also, it would be good to have a better commit log, to explain why you
> do this change. I assume it mainly gives nicer file names in
> $(KODI_DL_DIR), and that's of course a good point.

Correct, Arnout pointed me to this:
http://lists.busybox.net/pipermail/buildroot/2020-February/272556.html

Shall I send v2?

Regards, Bernd
