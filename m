From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Oct 2014 06:58:20 +0100
Subject: [Buildroot] [PATCH v3 7/7] package/tvheadend: Add transcoding
	support by ffmpeg
References: <1413311309-30811-1-git-send-email-bernd.kuhls@t-online.de>
 <1413311309-30811-7-git-send-email-bernd.kuhls@t-online.de>
 <20141028221104.35a56dd4@free-electrons.com>
Message-ID: <XnsA3D546EC787EEberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20141028221104.35a56dd4 at free-electrons.com:

>> +      --disable-libffmpeg_static          \
> 
> Maybe I haven't looked properly, but I don't see this option supported
> by tvheadend configure script. Can you check?

Hi,

you will find the option here:
https://github.com/tvheadend/tvheadend/blob/master/configure#L36

Regards, Bernd
