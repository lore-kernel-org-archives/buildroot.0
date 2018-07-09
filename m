From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 09 Jul 2018 19:45:36 +0200
Subject: [Buildroot] [PATCH v3 00/22] package/x11r7/xserver_xorg-server:
 bump version to 1.20.0
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
 <20180703215602.GG2530@scaer>
Message-ID: <0jjc1fxkra.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

thank you for your review!

Am Tue, 03 Jul 2018 23:56:02 +0200 schrieb Yann E. MORIN:

>>   package/x11r7/xdriver_xf86-video-mach64: bump version to 6.9.6
>>   package/x11r7/xdriver_xf86-video-vmware: bump version to 13.3.0
>>   package/x11r7/xdriver_xf86-input-mouse: bump version to 1.9.3
> 
> I skipped the review, they look simple, so I concentrated on the
> following patches:
> 
>>   package/x11r7/xdriver_xf86-video-r128: add patch to fix support for
>>     xserver_xorg-server 1.20.0
>>   package/x11r7/xdriver_xf86-video-savage: add patch to fix support for
>>     xserver_xorg-server 1.20.0
>>   package/x11r7/xdriver_xf86-video-sis: add upstream patch to fix
>>     support for xserver_xorg-server 1.20.0
> 
> r128, savage, and sis are all very, very old now. Like, 20 years or
> more... I wonder if it makes sense to keep them, given that none of
> those three natively cross-compile, and are starting to require patches
> to build against a recent X stack. The latter meaning that upstream is
> not even test-building those drivers anymore...

Up until now and even including the current bump to xserver_xorg-server 
1.20.0 I am still willing to support even the oldest drivers if I can 
find the necessary patches somewhere so from my POV it is ok to keep 
them. If Thomas or Peter think otherwise I can remove them since I have 
no personal interest in them ;)

Right now I am preparing a smaller patch series bumping some x11r7 
packages, splitting four xdriver_xf86* packages from this series along 
with three recent bumps by upstream. After that in the coming days I will 
send v4 of the xserver bump series.

Regards, Bernd
