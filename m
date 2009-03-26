From: daniele_dll <d.albano@gmail.com>
Date: Thu, 26 Mar 2009 18:50:25 +0100
Subject: [Buildroot] Failt to build a root for i386 architecture using
	lastest stable release
Message-ID: <159a01660903261050x5dc9a13sd2583dd74f4eac79@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi to all,

this is my first post here! I've discovered buildroot few days again
... i'ts great!

I'm trying to build a root system for coLinux ( Cooperative Linux)
because i need to reduce a lot memory and space requirements. I've
tried a lot of time to compile a i386 architecture (with i686 as
target architecture) but i can't get uclibc compiled, it's fails. I've
tried using uclibc 0.9.29, 0.9.30 and daily snapshot.

Using stable uclibc he said that sysdep.h is missing. If i comment the
include i get an error later, when the linker try to link thread
library (linuxthreads and nptl give the same error).

I've tried all combinations (gcc, binutils, kernel ...) but nothing to do.

This a known problem?

Thank you!

(I'm at office, and i don't have the error message here, i'll post it
when i'll back to the home)
