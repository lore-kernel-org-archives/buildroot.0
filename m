From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Mar 2011 22:47:23 +0200
Subject: [Buildroot] alsa-utils and nctp troubles with 2011.02
In-Reply-To: <20110308135528.494c0a89@surf> (Thomas Petazzoni's message of
	"Tue, 8 Mar 2011 13:55:28 +0100")
References: <F41B82AC38A41A41868925971DCBED9E06EEB9E9@rfomb01.corp.atmel.com>
	<20110308111936.0802c04e@surf>
	<F41B82AC38A41A41868925971DCBED9E06EEB9EE@rfomb01.corp.atmel.com>
	<20110308135528.494c0a89@surf>
Message-ID: <87sju8mgtg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Thank you for these answers, the problem was coming from too old cp
 >> (5.97)and tar (1.16) commands. My host distribution is a Debian 4.0.
 >> I have replaced them with more recent version and everything works
 >> fine.

 Thomas> Ok, good to know. Debian 4.0 is no longer supported by the
 Thomas> Debian project itself since February 2010, so I don't think
 Thomas> it's really worth the effort to support Debian 4.0 as the host
 Thomas> distribution in Buildroot.

 Thomas> Peter, your opinion ?

I agree. Even if we would try, none of the regular developers are using
such an ancient distribution, so chances are something else would break
soon again.

-- 
Bye, Peter Korsgaard
