From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 02 Jul 2016 17:25:30 +0200
Subject: [Buildroot] [PATCH/RFC] package/kodi: bump to version
	17.0-Krypton
References: <npc90dxkun.ln2@ID-313208.user.individual.net>
 <movk4dx0de.ln2@ID-313208.user.individual.net>
 <20160702164034.76b8530e@free-electrons.com>
Message-ID: <XnsA639B141C445EID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-
wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote in 
news:20160702164034.76b8530e at free-electrons.com:

>> http://patchwork.ozlabs.org/patch/640796/
>> [v2,2/4] package/kodi: Add suboption to control MySQL support
> 
> I made a comment on this one, asking why we add a sub-option instead of
> using an implicit, not sure I got a reply.

you will find my reply in the previous patchworks entry:
http://patchwork.ozlabs.org/patch/635581/

> Is ffmpeg 3.x mandatory for Kodi 17 ?

yes:
https://github.com/xbmc/xbmc/blob/master/tools/depends/target/ffmpeg/FFMPEG-
VERSION

Upstream bump to 3.1 is pending: https://github.com/xbmc/xbmc/pull/10039

> Cool! It's really very useful to have a contributor like you very
> active on keeping our Kodi support up to date!

Thanks, but keep in mind that my production platform is based on x86 with an 
Intel Haswell CPU using its internal GPU so my test chain includes libva-
intel-driver, X.org with xdriver_xf86-video-intel and mesa3d with 
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965, this combo should stay in usable shape in 
buildroot, I can not runtime test on other archs.

Regards, Bernd
