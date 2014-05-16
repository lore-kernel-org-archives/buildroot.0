From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 May 2014 16:09:43 +0200
Subject: [Buildroot] [PATCH v2 0/2] gdb fixes for xtensa
In-Reply-To: <1400168240-12105-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Thu, 15 May 2014 19:37:18 +0400")
References: <1400168240-12105-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87y4y1rf14.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Hi,
 > this series replaces existing gdb-7.4.1 patches for xtensa with their
 > backported versions from binutils-gdb and adds same patches for gdb-7.5.1.

 > Changes v1 -> v2:
 > - add #include <stdint.h> to fix build error due to missing uint32_t
 >   definition.

 > Max Filippov (2):
 >   gdb: replace xtensa patches with proper backports from binutils-gdb
 >   gdb: add xtensa fixes for 7.5.1

Committed both, thanks.

-- 
Bye, Peter Korsgaard
