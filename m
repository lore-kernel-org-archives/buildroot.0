From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Thu, 23 Jan 2014 19:47:53 +0100
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg2: new package
References: <cover.1390242867.git.yann.morin.1998@free.fr>
 <d4f3847e403c1e5c4e8733f75bbfccce6e0b4975.1390242867.git.yann.morin.1998@free.fr>
 <el80raxhff.ln2@ID-313208.user.individual.net>
 <20140120212701.GC3421@free.fr> <20140122223320.GD3592@free.fr>
 <8738kfd40w.fsf@dell.be.48ers.dk>
 <skn6raxead.ln2@ID-313208.user.individual.net>
 <20140123175214.GA3446@free.fr>
Message-ID: <pn48raxrjo.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:20140123175214.GA3446 at free.fr:

Hi,

> Do you know of another reason why Gotham can't build with latest ffmpeg2
> (that is, ffmpeg 2.1.3 or ffmpeg master)?

building gotham with ffmpeg git master is not the problem but last time I 
tried during runtime I had sound problems:
http://forum.xbmc.org/showthread.php?tid=180859&pid=1578887#pid1578887

Downgrading to ffmpeg 1.2.x, copying OpenELEC here, fixed the problem.
I still did not find the time to test the patch I mentioned on the xbmc forum 
though, maybe this weekend I find some time for this...

Btw, work seems to have started to support ffmpeg2 in xbmc:
https://github.com/FernetMenta/xbmc/commits/ffmpeg2

Regards, Bernd
