From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 08 Apr 2015 22:39:40 +0200
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: Fix Kodi 14.2 compile
References: <1428524507-30375-1-git-send-email-bernd.kuhls@t-online.de>
 <20150408223244.1d4c9cc4@free-electrons.com>
Message-ID: <XnsA476E6850811berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150408223244.1d4c9cc4 at free-electrons.com:

>> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+
55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> 
> I am not sure why I am in the SoB here, so I removed myself from here
> before applying.

sorry, this was not intentionally, I just reverted the commit bumping ffmpeg 
to 2.6.1

http://git.buildroot.net/buildroot/commit/package/ffmpeg?id=
4d094d9eb4edba5b6c3c229a2c02da1427e43fe5

to regain 0013-add-public-version-of-ff_read_frame_flush.patch, this file 
containes your SoB ;)

Regards, Bernd
