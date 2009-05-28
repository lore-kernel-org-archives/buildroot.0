From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 May 2009 16:19:22 +0200
Subject: [Buildroot] Illegal instruction with buildroot busybox for ARM
	DNS323
In-Reply-To: <20090528071954.43F938735C@cal1-1.us4.outblaze.com> (Barney
	Barumba's message of "Thu\, 28 May 2009 17\:19\:54 +1000")
References: <20090528071954.43F938735C@cal1-1.us4.outblaze.com>
Message-ID: <871vq971jp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Barney" == Barney Barumba <barney.b@iname.com> writes:

Hi,

 Barney> For simple commands, such as "/bin/busybox-br ls" this worked
 Barney> perfectly, but trying more complicated commands, such as
 Barney> "/bin/busybox-br sh" failed with the "Illegal instruction"
 Barney> error.

Quick quess - Did you configure BR for hardware floating point and
didn't enable floating point emulation in the kernel?

-- 
Bye, Peter Korsgaard
