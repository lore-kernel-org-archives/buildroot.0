From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Sep 2010 22:26:46 +0200
Subject: [Buildroot] e2fsck crashes
In-Reply-To: <4C9B3DBC.7040700@signaturealpha.com> (Marc Leclerc's message of
	"Thu, 23 Sep 2010 07:45:00 -0400")
References: <4C9B3DBC.7040700@signaturealpha.com>
Message-ID: <878w2s8aux.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marc" == Marc Leclerc <marc-leclerc@signaturealpha.com> writes:

 Marc>  Hi,
 Marc> Every attemps to include e2fsprogs on my target results in the
 Marc> utilities crashing with a segfault.

 Marc> Sep 23 01:39:39 sa_linux user.info kernel: e2fsck[987]: segfault at 20
 Marc> ip b77316b8 sp bf968534 error 4
 Marc> Sep 23 01:39:39 sa_linux user.info kernel:  in
 Marc> libuClibc-0.9.31.so[b7727000+43000]

 Marc> Any idea why

Please provide a bit more details. What buildroot .config are you using
and what is the exact command line that causes a crash?

-- 
Bye, Peter Korsgaard
