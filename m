From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 30 Mar 2016 21:44:30 +0200
Subject: [Buildroot] [PATCH v4 18/19] package/tvheadend: bump version
References: <1459194585-12593-1-git-send-email-bernd.kuhls@t-online.de>
 <1459194585-12593-19-git-send-email-bernd.kuhls@t-online.de>
 <20160329144510.0510cbe8@free-electrons.com>
 <20160330175440.5bb5dc43@free-electrons.com>
 <E1alK55-0006sQ-Lb@fli4l.lan.fli4l>
 <20160330194721.32f45091@free-electrons.com>
Message-ID: <XnsA5DBDD2ABD4D1berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20160330194721.32f45091 at free-electrons.com:

> Hello,
> 
> On Wed, 30 Mar 2016 19:38:59 +0200, Bernd Kuhls wrote:
> 
>> instead of reverting the tvheadend bump my new ffmpeg 3.0 patch series
>> could be committed, it includes a uclibc-ng compilable vlc ;)
> 
> When is VLC 3.0 due to be released?

Hi Thomas,

according to https://trac.videolan.org/vlc/roadmap the release is overdue.

Phoronix does not mention a release date:
http://www.phoronix.com/scan.php?page=news_item&px=VLC-3.0-Still-Being-
Developed
http://www.phoronix.com/scan.php?page=news_item&px=VLC-3.0-2016-Update

Since 2014-02-25 we carry a "big fat warning" about know issues with vlc:
https://git.busybox.net/buildroot/commit/package/vlc/Config.in?
id=e33019aaa0409e35b725dddffe09e3e2a42959d1

Recently I thought about removing it but now I suggest to keep the warning 
and bump vlc to its git master branch to free the way for ffmpeg 3.0 ;)

Regards, Bernd
