From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Thu, 19 Jun 2014 07:20:50 +0200
Subject: [Buildroot] libgstmediaplayer
Message-ID: <53A27332.6040509@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
in order to enable the QtMultimedia module and to avoid this error message:

[ defaultServiceProvider::requestService(): no service found for - 
"org.qt-project.qt.mediaplayer" ]

it needs to compile libgstmediaplayer.so.


I'm not able to find which buildroot package I have to select in order 
to compile that library!
I was expecting it should be built after selecting Qt5 > Extra options > 
gstreamer.

Thanks in advance
Marco
