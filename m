From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 17 May 2016 18:30:57 +0200
Subject: [Buildroot] kodi 16 on aarch64
References: <trinity-8cc2631d-885d-437a-aec1-a88667084c0c-1463257448483@3capp-mailcom-bs05>
 <XnsA60AC45F57D8AberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <trinity-0209bbe1-f2c4-4b12-8756-00ade5864efc-1463423339523@3capp-mailcom-bs13>
Message-ID: <XnsA60BBC5AFEAAEID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Hi daggs,

daggs <daggs@gmx.com> wrote in
news:trinity-0209bbe1-f2c4-4b12-8756-00ade5864efc-1463423339523 at 3capp-mailc
om-bs13: 

> Greetings,
>> Sent: Monday, May 16, 2016 at 8:18 PM
>> From: "Bernd Kuhls"
>> <bernd.kuhls@t-online.de> 
[...]
>> Kodi 16.x-Jarvis has no support for aarch64, the next version
>> 17.x-Krypton will have it after my pull request was accepted:
>> https://github.com/xbmc/xbmc/commit/62c160c23ed4c074d106f30a43638fac6656
>> 8ac6 
> I've tried that patch, it isn't enough, there is a need for more patches
> as it fails compilation. 

I never said that Kodi 16.x compiles on aarch64 since I never tested it,
compiling Kodi 17.x worked without problems. Due to lack of hardware I can
not do runtime testing. 

>> You can also try my buildroot fork with Kodi 17 patches:
>> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/148325
>> 
> I'm trying to backport the needed patches to kodi 16, in general it
> compiles (one of the patches is questionable), didn't got to test it
> yet. 

My fork is not meant to be backported since Kodi 17 contains numerous
changes regarding internal libs, you are on your own here ;) 

Regards, Bernd
