From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 29 Mar 2016 07:55:50 +0200
Subject: [Buildroot] [PATCH v4 00/19] Bump ffmpeg to 3.0
References: <1459194585-12593-1-git-send-email-bernd.kuhls@t-online.de>
 <20160329032439.69c9ec72@free-electrons.com>
Message-ID: <60ipscxok6.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 29 Mar 2016 03:24:39 +0200 schrieb Thomas Petazzoni:

>>   package/vlc: mark as broken due to incompatibility with ffmpeg 3.0
> 
> This is rather annoying IMO. I don't think it's really reasonable to
> mark VLC as broken. When is VLC 3.0 due to be released ?

Hi,

it seems the build error I saw using uClibc-ng does not occur with glibc.

Here is the trac ticket I created:
https://trac.videolan.org/vlc/ticket/16768

I will send a new patch series bumping vlc to its master branch and 
disabling it with uclibc-ng for now, ok?

Regards, Bernd
