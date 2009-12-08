From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Dec 2009 10:01:03 +0100
Subject: [Buildroot] missing kernel headers when compiling kismet
In-Reply-To: <A208E45D-08AF-4294-ADEA-4734E3530DDC@hsr.ch> (Marc Egli's
	message of "Mon, 7 Dec 2009 21:28:13 +0100")
References: <A208E45D-08AF-4294-ADEA-4734E3530DDC@hsr.ch>
Message-ID: <87r5r5on5c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marc" == Marc Egli <marc.egli@hsr.ch> writes:

 Marc> configuring kismet fails with the following message:
 Marc> checking for linux/wireless.h... (cached) no
 Marc> configure: error: Failed to find a usable linux/wireless.h header for Linux Wireless Extensions.  Either your kernel headers are missing or are incorrect.  See config.log for the exact error.  Compiling without wireless headers must be explicitly disabled
 Marc> make: *** [/emb/buildroot/output/build/kismet-2009-06-R1/.stamp_configured] Error 1

Hmm, it builds here - Please post your config. Notice that the above
check has been cached, does it work if you run make flush; make?

-- 
Bye, Peter Korsgaard
