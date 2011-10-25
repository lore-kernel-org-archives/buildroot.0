From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Oct 2011 12:30:35 +0200
Subject: [Buildroot] [PATCH 5/6] qemu_sh4_r2d: update to kernel 3.1 and
	update readme
In-Reply-To: <d232d63f548d58fc6d7af13f979b9153@zacarias.com.ar> (Gustavo
 Zacarias's message of "Tue, 25 Oct 2011 06:53:59 -0300")
References: <1319485334-15790-1-git-send-email-gustavo@zacarias.com.ar>
 <1319485334-15790-5-git-send-email-gustavo@zacarias.com.ar>
 <87ehy1y4eg.fsf@macbook.be.48ers.dk>
 <d232d63f548d58fc6d7af13f979b9153@zacarias.com.ar>
Message-ID: <87zkgpuzw4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 >> I prefer to run the getty on the serial port for the qemu defconfigs,
 >> because it's closer to what is typically done on hw (and makes it
 >> easier
 >> to reuse rootfs on real hw).

 Gustavo> Me too for real embedded targets unlike qemu-system-x86.
 Gustavo> Unfortunately either qemu 0.14 doesn't emulate the UART and/or the
 Gustavo> real target doesn't have one.

Ok, I'll commit it then - Thanks.

-- 
Bye, Peter Korsgaard
