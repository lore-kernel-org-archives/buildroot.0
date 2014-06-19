From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Thu, 19 Jun 2014 09:35:00 +0200
Subject: [Buildroot] libgstmediaplayer
In-Reply-To: <53A27332.6040509@gmail.com>
References: <53A27332.6040509@gmail.com>
Message-ID: <53A292A4.8040800@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I try to answer by myself: it won't work because gt5 supports only 
gstreamer 0.1. I rebuilding all with gstreamer 0.1.

By the way it seems changing the two lines in 
libavcodec/arm/ac3dsp_armv6.S as suggested by Arnout Vandecappelle did 
the trick. Now libavcodec is compiling.

Regards
Marco

--

Il 19/06/2014 07:20, Marco Trapanese ha scritto:
> Hello,
> in order to enable the QtMultimedia module and to avoid this error 
> message:
>
> [ defaultServiceProvider::requestService(): no service found for - 
> "org.qt-project.qt.mediaplayer" ]
>
> it needs to compile libgstmediaplayer.so.
>
>
> I'm not able to find which buildroot package I have to select in order 
> to compile that library!
> I was expecting it should be built after selecting Qt5 > Extra options 
> > gstreamer.
>
> Thanks in advance
> Marco
>
