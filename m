From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 May 2021 14:35:28 +0200
Subject: [Buildroot] Building buildroot-2014.08
In-Reply-To: <CAAtAE2SyKGrskeFEWhwH0E7GNRVGU=TGk2AuFrv4haxqaJHGGw@mail.gmail.com>
 (Andrey Krasheninnikov's message of "Thu, 13 May 2021 15:05:45 +0300")
References: <CAAtAE2SyKGrskeFEWhwH0E7GNRVGU=TGk2AuFrv4haxqaJHGGw@mail.gmail.com>
Message-ID: <87zgwyu7zj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrey" == Andrey Krasheninnikov <akrashenin@gmail.com> writes:

 > Hello!
 > I have buildroot-2014.08.
 > My linux is ubuntu-16.4.
 > Kernel 4.9.14. glibc-2.18.
 > I built zImage and dtb-file.
 > I need to build rootfs.
 > Compilation was broken for package ncurses-5.0.

Buildroot 2014.08 is very old and no longer supported. Please use
Buildroot 2021.02.2 instead.

With that said, Buildroot 2014.08 had ncurses 5.9, so it is odd to see
references to ncurses 5.0. Is this an unmodified Buildroot 2014.08?

-- 
Bye, Peter Korsgaard
