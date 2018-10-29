From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Oct 2018 17:05:51 +0100
Subject: [Buildroot] gcc 8.2.0 support for buildroot 2015.11
In-Reply-To: <CALD51P_=q448T76Mi66Sjcy8Lfdhi-UKBn0A33_6isVHU_-bFQ@mail.gmail.com>
 (Lijun QIN's message of "Mon, 29 Oct 2018 10:46:50 -0500")
References: <CALD51P_=q448T76Mi66Sjcy8Lfdhi-UKBn0A33_6isVHU_-bFQ@mail.gmail.com>
Message-ID: <87in1kzqjk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lijun" == Lijun QIN <lijun.qin2008@gmail.com> writes:

 > I generated gcc 8.2.0  arm-buildroot-linux-gnueabihf-gcc using
 > buildroot-2018.08.2.
 > I need to use arm gcc 8.2 to compile my project (buildroot 2015.11 + C++
 > Codebase)  to leverage C++17 features.
 > Buildroot 2015.11 seems to only support gcc up to version 5.x.
 > Any patch to make 2015.11 to support arm gcc 8.2 as external toolchain ?

Sorry, but you are on your own. Old software is unlikely to build with
gcc 8.2 out of the box.

Buildroot 2015.11 is (for a long time) no longer supported. What is
keeping you from moving to Buildroot 2018.08.2?

-- 
Bye, Peter Korsgaard
