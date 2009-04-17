From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Apr 2009 15:56:15 +0200
Subject: [Buildroot] Properly setting up hotplug
In-Reply-To: <d6cda7730904170152o5bfccb10u56409f747d8f1783@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Fri\, 17 Apr 2009
	05\:52\:48 -0300")
References: <35AF1D2435E24FA6B1C89344B22D099E@apexjs>
	<d6cda7730904170152o5bfccb10u56409f747d8f1783@mail.gmail.com>
Message-ID: <873ac79yf4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 Thiago> I actually will do rm -rf build_* binaries project_* most of
 Thiago> the time.

I normally do rm -rf *build_*.

 Thiago> I don't like distclean because it will remove the downloaded files,

Only if you have it set as BASE_DIR/dl. I expect most people who use
BR on a regular schedule to store their downloads somewhere else.

 Thiago> and clean usually leaves a lot of stuff in the rootfs.

That would be a bug, but yes.

-- 
Bye, Peter Korsgaard
