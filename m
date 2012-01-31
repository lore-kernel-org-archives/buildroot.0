From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 31 Jan 2012 23:20:01 +0100
Subject: [Buildroot] problem when using build cache ?
In-Reply-To: <3DA04F4AA8F24A45B49F31E8169AE50E@JohanW7> (Sagaert Johan's
 message of "Tue, 31 Jan 2012 20:38:51 +0100")
References: <9C7AEB06A00A49B5BC4F3D164ABB579E@JohanW7>
 <8739avkfhp.fsf@macbook.be.48ers.dk>
 <3DA04F4AA8F24A45B49F31E8169AE50E@JohanW7>
Message-ID: <87ty3bikfi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> After some search i found that if you create a directory under /lib/udev/devices/pts  then udev will create(copy) this directory
 Sagaert> under /dev so I think its not needed to do it in inittab.

It is for non-udev builds, so it makes most sense to to it in
/etc/inittab.

-- 
Bye, Peter Korsgaard
