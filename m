From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 18 Feb 2012 08:52:06 +0100
Subject: [Buildroot] Fwd: qemu with buildroot problems
In-Reply-To: <CA+DALLQeQzds0s7dmogoBwNND3LAPBSG_AWmXwSM8we2cBOcAg@mail.gmail.com>
 (Ali Beddah's message of "Sat, 18 Feb 2012 04:41:07 +0200")
References: <CA+DALLSKohmgnk8rR35xZSHHf4x=Ky=+kw8nceLdCb9+RWw7sQ@mail.gmail.com>
 <CA+DALLQeQzds0s7dmogoBwNND3LAPBSG_AWmXwSM8we2cBOcAg@mail.gmail.com>
Message-ID: <874nuo4lzt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ali" == Ali Beddah <ali.beddah@gmail.com> writes:

Hi,

 Ali> hi after compiling buildroot i got rootfs.tar and zimage when i
 Ali> tried to emulate operating system by qemu i use alot of ways by
 Ali> googling but all failed ?what is the optimum way to do emulation
 Ali> for my operating system

You haven't told us what architecture you are building for, but have a
look at our configs/qemu_* defconfigs, and the corresponding
documentation about how to run qemu in board/qemu/*/readme.txt

-- 
Bye, Peter Korsgaard
