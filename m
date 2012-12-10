From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Dec 2012 20:20:51 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 (Willy Lambert's message of "Mon, 10 Dec 2012 15:53:54 +0100")
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
Message-ID: <87d2yhsoh8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Willy" == Willy Lambert <lambert.willy@gmail.com> writes:

Hi,

 >> Large file support isn't select and i have also checked it with make
 >> uclibc-menuconfig for uclibc.
 >> The same problem happend with beaglebone_defconfig.
 >> 
 >> After "make clean" and selecting "large file support" the build process
 >> works.
 >> 
 >> This problem doesn't happend with release 2012.08.
 >> 
 >> Has anybody a hint for me ?

 Willy> I have just had the same problem, is it possible that this is a
 Willy> regression of the 2012.11 version ?

I don't think so. I just did a:

make at91sam9263ek_defconfig && make

Without any problems. What exactly did you do?

-- 
Bye, Peter Korsgaard
