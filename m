From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 24 Oct 2009 09:33:46 +0200
Subject: [Buildroot] BusyBox or kernel bug?
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901E24D3D@mi8nycmail19.Mi8.com>
	(H. Hartley Sweeten's message of "Fri\,
	23 Oct 2009 18\:37\:23 -0400")
References: <BD79186B4FD85F4B8E60E381CAEE190901E24D3D@mi8nycmail19.Mi8.com>
Message-ID: <87aazh1c11.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> Hello all,
 H> I just tried to run the BusyBox applet 'showkey' and got the following:

 H> / # showkey
 H> showkey: KDGKBMODE: Invalid argument
 H> / # uname -r
 H> 2.6.31.4

I haven't ever used the showkey applet. You might have more luck asking
on the busybox list.

From a quick look at the kernel sources - Did you enable CONFIG_VT
(virtual terminal) in the kernel?

-- 
Bye, Peter Korsgaard
