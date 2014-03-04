From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Tue, 04 Mar 2014 08:43:28 +0100
Subject: [Buildroot] raspberry pi, Qt5 and audio output
In-Reply-To: <53104169.90506@gmail.com>
References: <53104169.90506@gmail.com>
Message-ID: <53158420.6070408@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,
about the problem described below, someone in a Qt forum tells me:

"You need to install GStreamer dev libraries, with the relevant 
GStreamer plugins for decoding MP3 data."

I found the mp3 plugin in gst-plugins-good (id3demux) but I can't find 
the -dev libraries of GStreamer 0.1. I searched with F8 in menu nconfig.

Thanks!
Marco
--

Il 28/02/2014 08:57, Marco Trapanese ha scritto:
> Hello,
> with buildroot Buildroot 2014.02-rc3-00017-g29e5833 and the attached 
> .config file I'm able to run Qt5 + webkit application on the RPi.
> Still I cannot execute any audio file using Qt5 Multimedia.
>
> I get a warning like this:
>
> defaultServiceProvider::requestService(): no service found for - 
> "org.qt-project.qt.mediaplayer"
>
> Anyway I can play any file using aplay, or other players.
> Perhaps I miss some qt-related stuff... did someone run into the same 
> problem?
>
> Thanks!
> Marco
>
