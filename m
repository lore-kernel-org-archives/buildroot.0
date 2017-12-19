From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 19 Dec 2017 06:33:58 +0100
Subject: [Buildroot] [PATCH] utils/checkpackagelib: exclude two files
 from Config.in indentation check
References: <20171218220344.GC2903@scaer>
 <5a3872168413e_bd03fa7729df43c853dd@ultri3.mail>
Message-ID: <XnsA85042CB7A40BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote in
news:5a3872168413e_bd03fa7729df43c853dd at ultri3.mail: 

>> AFAICS, that special indentation is about the 'source' lines... Surely
>> that does not bring much to have them indented, and they could simply
>> be left-aligned...
> 
> Makes sense to me.
> Let's include the developers for those 2 files to see if they have
> arguments to keep or change.

Hi,

the layout of package/x11r7/Config.in was introduced in the initial commit 
more than ten years ago:

https://git.busybox.net/buildroot/commit/package/x11r7/Config.in?
id=a7e49eb2af5d2ca6e53fb908fddfddd92696910a

When starting to add more Kodi packages since 2015

https://git.busybox.net/buildroot/commit/package/kodi/Config.in?id=
81c438aa207e8fdea776ae946a4d2d3f57cc143f

I used a similar layout without any particular reason.

I have no objections to remove the current indentations to make 
checkpackagelib happy.

Regards, Bernd
