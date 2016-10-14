From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 Oct 2016 15:18:13 +0000
Subject: [Buildroot] [Bug 9356] gdb package
In-Reply-To: <bug-9356-163@https.bugs.busybox.net/>
References: <bug-9356-163@https.bugs.busybox.net/>
Message-ID: <bug-9356-163-fNTxj9B4Rd@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9356

--- Comment #2 from kosyak <gmg.kostik@gmail.com> ---
Soory for my English.

Lubuntu x86 16.04.

make raspberrypi3_defconfig


Toolchain (Linaro ARM 2014.09)  --->

Toolchain  --->
  [*] Build cross gdb for the host

Target packages  --->
   Debugging, profiling and benchmark  --->
      [*] gdb
      -*-   gdbserver


make -j4 2>&1 > log.txt


https://dl.dropboxusercontent.com/u/15370742/log.txt

I replaced the file package/gdb/gdb.mk on the version from buildroot-2016.08.1
- 
compile with no error.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
