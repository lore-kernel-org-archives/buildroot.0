From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Tue, 18 Mar 2014 14:22:09 +0100
Subject: [Buildroot] Error building Qt5Multimedia
In-Reply-To: <53284767.3040408@gmail.com>
References: <53269705.6060805@gmail.com>
 <CAAXf6LVoTKqC61B2fPbwp-9LQZ1ephfpEodHVfqedB7SPyn7kg@mail.gmail.com>
 <532828E8.5040405@gmail.com>
 <CAAXf6LVvo4VSgkHawfNuftrqW317QzQ8FO2c-1k33datwdpfSg@mail.gmail.com>
 <53284767.3040408@gmail.com>
Message-ID: <53284881.1090803@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 18/03/2014 14:17, Marco Trapanese ha scritto:
>
> it seems it doesn't find gstreamer:


I confirm that:

executing config test gstreamer
+ cd 
/home/marco/dev/buildroot/output/build/qt5multimedia-5.2.1/config.tests/gstreamer 
&& /home/marco/dev/buildroot/output/h$
Project ERROR: gstreamer-0.10 development package not found
test gstreamer FAILED


What's the name of the gstreamer-0.10 development package in buildroot?
I can't find anything in nconfig or in the package dir.

Marco
