From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 May 2009 21:03:19 +0200
Subject: [Buildroot] hang generating DSA keys
In-Reply-To: <358556.29433.qm@web56902.mail.re3.yahoo.com> (Frank Hoeflich's
	message of "Sun\, 24 May 2009 11\:22\:30 -0700 \(PDT\)")
References: <358556.29433.qm@web56902.mail.re3.yahoo.com>
Message-ID: <87my92fhmw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hoeflich <frankhoeflich@yahoo.com> writes:

 Frank> The entropy mechanism depends on keyboard input - I'd expect
 Frank> it to be waiting for I/O.  If you type some characters it will
 Frank> use them to generate the keys and be on its way.

Yes, if the programs are using /dev/random instead of /dev/urandom. Is
this openssh or dropbear? Dropbear uses /dev/urandom by default, but I
don't know what openssh does.

-- 
Bye, Peter Korsgaard
