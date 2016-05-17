From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 17 May 2016 18:32:44 +0200
Subject: [Buildroot] kodi 16 on aarch64
References: <trinity-8cc2631d-885d-437a-aec1-a88667084c0c-1463257448483@3capp-mailcom-bs05>
 <XnsA60AC45F57D8AberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20160516215001.330f6437@free-electrons.com>
Message-ID: <XnsA60BBCA81C503ID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote 
in news:20160516215001.330f6437 at free-electrons.com:

> Hello,
> 
> On Mon, 16 May 2016 19:18:16 +0200, Bernd Kuhls wrote:
> 
>> You can also try my buildroot fork with Kodi 17 patches:
>> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/148325
> 
> BTW, the next branch is opened, so we can take your Kodi 17 patches.

I doubt you will take them because

- Kodi 17.x depends on ffmpeg3
- the ffmpeg series contains bumping vlc to git master, vlc 3.0 was not released yet
- Kodi 17.0 is also not released, git master is at alpha2 atm

My github stuff is only a RFC, as usual ;)

Regards, Bernd
