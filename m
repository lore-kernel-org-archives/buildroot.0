From: Sid Bharij <sid.bharij@gmail.com>
Date: Tue, 4 Nov 2014 15:34:54 -0600
Subject: [Buildroot] Buildroot and apt-get
Message-ID: <CAEk40fyze1gZL_x52zfESUqLzTMsjAUdmEKPVYL7DZJ2=3D1vQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am new to linux.

I am trying to get a webcam installed on my pi.
I created the kernel image using buildroot. The pi came up and I was
able to ssh to it. But when I try to do a apt-get install motion it
says apt-get not found. I checked the rootfs and it does not have the
apt-get file in it.

What do I need to do in order to get the apt-get to work, is there
some post build script that I need which will install motion on the
target ? or is there some setting in buildroot

Thanks,
Sid
