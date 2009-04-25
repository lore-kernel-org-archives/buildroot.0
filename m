From: Luciano Greiner <luciano.greiner@gmail.com>
Date: Fri, 24 Apr 2009 23:02:37 -0300
Subject: [Buildroot] MythTV PVR Building
In-Reply-To: <49F25151.9010606@openelec.tv>
References: <26fbce020904241515g2a95805dm7db3fb4aeda65d99@mail.gmail.com>
	<49F23EED.7030809@openelec.tv> <49F25151.9010606@openelec.tv>
Message-ID: <26fbce020904241902w28b84377k899d1493c604f92f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That's great. I apreciate it! I'll take a look at your work. Actually
now i'm trying to compile the SVN trunk version of MythTV that is made
for QT 4. I'm having some compilation problems like that:

...
/mnt/lfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ar:
illegal option -- y
Usage: /mnt/lfs/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-ar
...

So i think it's not yet compatible with uclibc. I'm trying to figure
out how to correct those problems and go ahead.

Thanks for your work!

On Fri, Apr 24, 2009 at 8:54 PM, Stephan Raue <mailinglists@openelec.tv> wrote:
> you can download this from
> http://sources.openelec.tv/archive/mythtv.work.tar.bz2
>
> Am 25.04.2009 00:36, schrieb Stephan Raue:
>>
>> Am 25.04.2009 00:15, schrieb Luciano Greiner:
>>>
>>> Hello!
>>>
>>> ? I am trying to make some MythTV PVR buid scripts to work with
>>> Buildroot. Please contact me, if anyone is interested to help and or
>>> have some experience in MythTV cross compile.
>>>
>>> Thanks
>>>
>>
>> i have do this for more then 1 year with buildroot and later geexbox
>> when you intrested i can send patches (i think outdated, but helpfull)
>>
>> Stephan
>>
> here are the patches and package buildscripts (based on geexbox). i have
> build mythtv for over 1 year with directfb/qt/embedded support. the frontend
> has started. many things are untested/ does not work. i switched to elisa
> mediacenter. eventually i switch back later on mythtv (with xorg/opengl),
> because elisa is not complete enough for me.
>
> Stephan
>
> --
> ? ? ? ? ? ? ? ### OpenELEC.tv ###
> The free and open Mediacenter Distribution 4 you
> ? ? ? ? ? ? ?http://www.openelec.tv
>
>
>



-- 
Luciano Greiner
