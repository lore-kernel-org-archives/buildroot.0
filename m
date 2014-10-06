From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 06 Oct 2014 21:14:01 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-05
References: <20141006063013.D7B26101723@stock.ovh.net>
 <20141006094333.211d8a76@free-electrons.com>
Message-ID: <XnsA3BED80009E38berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20141006094333.211d8a76 at free-electrons.com: 

>>         sh4a |                      vlc-2.1.5 | NOK |
>>         http://autobuild.buildroot.net/results/4e6b7a7822ef2c0f1d2e52103
>>         6252960e999acfa/ 
> VLC/Qt issue:
>   CXX      libqt4_plugin_la-main_interface.moc.lo
> main_interface.moc.cpp:14:2: error: #error "This file was generated
> using the moc from 4.6.3. It" main_interface.moc.cpp:15:2: error: #error
> "cannot be used with the include files from this version of Qt." 
> main_interface.moc.cpp:16:2: error: #error "(The moc has changed too
> much.)" Bernd, maybe ?

Hi Thomas,

I still can not reproduce the error here:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/94721

It only happens on Peter?s autobuilder since Sep 13th:
http://autobuild.buildroot.net/?reason=vlc-2.1.5

Maybe a local moc binary is getting in the way?

Regards, Bernd
