From: AAlex_ <earthquake.de@freenet.de>
Date: Thu, 15 Feb 2018 06:00:53 -0700 (MST)
Subject: [Buildroot] Inconsistency detected by ld.so while booting
Message-ID: <1518699653540-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
on boot (last while booting: freeing unused kernel memory) I get the error
'Inconsistency detected by ld.so: get-dynamic-info.h: 145:
elf_get_dynamic_info: Assertion info[DT_RUNTPATH] ==NULL failed!
BUT:
I copy the whole buildroot-tree to my virtual machine, do a make clean, a
make config (without any changes!) call make. The built disk image boots
without any problem. Copy back the whole tree and make again,same error on
boot..... Using gcc-4.8 on both machines. 
Any idea? 

Best regards,
Alex



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
