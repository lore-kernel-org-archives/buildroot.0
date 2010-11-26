From: Abhishek Ashtekar <Abhishek.Ashtekar@ubitronix.com>
Date: Fri, 26 Nov 2010 09:33:30 +0100
Subject: [Buildroot] AT91SAM9G20 Buildroot Hangs
In-Reply-To: <87ipzl34rq.fsf@macbook.be.48ers.dk>
References: <0C11C5BF0B29FD43A8D0250F711D497F7FB01A662F@ex01-ubitronix.ubitronix.local>
	<AANLkTikmMd6z05CAzXN+e4AM5R4FvcinKgsDJZEOC1Lo@mail.gmail.com>
	<0C11C5BF0B29FD43A8D0250F711D497F7FB01A6631@ex01-ubitronix.ubitronix.local>
	<AANLkTinY7n6ZHH4Ci8A4KwGeZ-5gv0WkTSqY1hPQxuuk@mail.gmail.com>
	<87ipzl34rq.fsf@macbook.be.48ers.dk>
Message-ID: <0C11C5BF0B29FD43A8D0250F711D497F7FB01A6638@ex01-ubitronix.ubitronix.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yess ..... it works.
Now I get the login prompt and able to login.

Thanks a lot.

Abhishek

-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter Korsgaard
Sent: Donnerstag, 25. November 2010 14:35
To: Paulius Zaleckas
Cc: Abhishek Ashtekar; buildroot at busybox.net
Subject: Re: AT91SAM9G20 Buildroot Hangs

>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:

 Paulius> On Thu, Nov 25, 2010 at 3:07 PM, Abhishek Ashtekar
 Paulius> <Abhishek.Ashtekar@ubitronix.com> wrote:
 >> Hello Paulius,
 >>
 >> Attaching the /etc/inittab

 Paulius> Ok. Check out Peters response. The problem is here:

 Paulius> # Put a getty on the serial port
 Paulius> #ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL

 Paulius> as you can see getty is commented out here. I guess serial port is not
 Paulius> correct either.

It is (according to the kernel cmdline), so just remove the '#' at the
beginning of the line.

--
Bye, Peter Korsgaard

--
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



__________ Hinweis von ESET NOD32 Antivirus, Signaturdatenbank-Version 5647 (20101125) __________

E-Mail wurde gepr?ft mit ESET NOD32 Antivirus.

http://www.eset.com



__________ Hinweis von ESET NOD32 Antivirus, Signaturdatenbank-Version 5649 (20101125) __________

E-Mail wurde gepr?ft mit ESET NOD32 Antivirus.

http://www.eset.com
