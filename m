From: Charles Krinke <charles.krinke@gmail.com>
Date: Fri, 2 Dec 2011 14:37:17 -0800
Subject: [Buildroot] USB FAT drive in Linux on MPC8321
Message-ID: <CALo-6+i-OXWXHxpmsH4tab9RBhT5qoWOcpSbfR84nbt9GaAn4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gentlemen:

I seem to be having a file name issue with USB drives with my MPC8321
target. This isnt a buildroot issue so much as a plea for help in
understanding how I can gain sanity back into this FAT USB disk issue.

To illustrate, here is an ls from my debian laptop followed by an ls
of the same USB drive from the MPC8321 target illustrating the issues.

I do have the module vfat in the build, so it is something more then vfat.ko

ls /media/801C-A3AB/
1q.bmp
2q.bmp
4.bmp
5.bmp
Logic Setup 1.1.5.1 (32-bit).exe
SdlcSerialAnalyser.dll
startup
TEES2009.pdf
CD00264885.pdf
TEMP
CHKSER
 TempATCControllerFirmwarePDP.doc
CHKUSB
 TESTCLOC
CK

1q    ~1.bmp
2q    ~1.bmp
4     ~1.bmp
5     ~1.bmp
logics~1.exe
sdlcse~1.dll
startup
tees2009.pdf
temp
testcloc

-- 
Charles Krinke
