From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Mar 2018 21:04:34 +0100
Subject: [Buildroot] [PATCH v4] systemd: switch to en_US.UTF-8 locale
 when building
In-Reply-To: <20180301191207.GB2449@scaer> (Yann E. MORIN's message of "Thu, 1
 Mar 2018 20:12:07 +0100")
References: <20180212213400.15061-1-julius@kriukas.lt>
 <20180222230055.25455-1-julius@kriukas.lt>
 <20180228213104.GA16465@scaer> <20180228231347.1e2896a2@windsurf.lan>
 <20180301180639.GA2449@scaer> <87y3jbhbqc.fsf@dell.be.48ers.dk>
 <20180301191207.GB2449@scaer>
Message-ID: <87r2p3h8a5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Wait, are you saying that it doesn't build with en_GB.UTF-8 locale?
 >> That's odd.

 > No, no, don't worry!

 > In my locale, en_GB.UTF-8, systemd-v237 *does* build fine.

 > But on my autobuilder, which only has C, POSIX, and C.UTF-8, the default
 > being POSIX, I had to explicitly set it to C.UTF-8 to test without the
 > patch.

 > So, don't worry, all is well when the current locale is any of *.UTF-8.

*Pheeuw* ;)

-- 
Bye, Peter Korsgaard
