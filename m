From: Alexander Broekhuis <a.broekhuis@gmail.com>
Date: Tue, 1 May 2012 08:35:01 +0200
Subject: [Buildroot] Fedora 16: Cannot find -lc
Message-ID: <CA+T-u8d3owC=YNJ5O9V6MUaahdSOPo21H+5aLxxnf8xan5GyHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I am trying to use buildroot on a Fedora 16 installation and run into the
following error:

/usr/bin/ld: cannot find -lc
collect2: ld returned 1 exit status

The last make command before the error:
make[2]: Entering directory
`/home/alexander/Development/buildroot/output/build/host-module-init-tools-3.15/build'
/usr/lib/ccache/gcc  -O2
-I/home/alexander/Development/buildroot/output/host/include
-I/home/alexander/Development/buildroot/output/host/usr/include -Wunused
-Wall -static -L/home/alexander/Development/buildroot/output/host/lib
-L/home/alexander/Development/buildroot/output/host/usr/lib
-Wl,-rpath,/home/alexander/Development/buildroot/output/host/usr/lib -o
insmod.static insmod.o libmodtools.a

I am using the latest buildroot and also tried to use a snapshot release.
Is this a known bug, or am I doing something wrong?

Tia!

-- 
Met vriendelijke groet,

Alexander Broekhuis
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120501/9bff22ba/attachment.html>
