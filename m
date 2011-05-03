From: Morten Leikvoll <nerd@cyviz.com>
Date: Tue, 3 May 2011 14:15:38 +0200
Subject: [Buildroot] sensors-detect and perl
Message-ID: <37F0A12844A44CC987DE6597E8FFDF21@LEIKVOLLPC>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is my first post here! Bear with me :)

Im trying to get sensors-detect running but it needs perl to work. Ive tried 
to add microperl and the modules needed, but I ony get the error:

# sensors-detect
Can't load module Fcntl, dynamic loading not available in this perl.
  (You may need to build a new perl executable which either supports
  dynamic loading or has the Fcntl module statically linked into it.)
 at /usr/sbin/sensors-detect line 26
Compilation failed in require at /usr/sbin/sensors-detect line 26.
BEGIN failed--compilation aborted at /usr/sbin/sensors-detect line 26.
#

(using buildroot 2011-02)

I guess I have to add a full perl to make dynamic loading work.. Can anyone 
give me directions? I was hoping that since you put sensors-detect in the 
menuconfig, there would be some other options to make it run?

PS:I would like to have reproducable code, so I prefer doing it in the 
config files.
