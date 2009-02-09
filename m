From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 09 Feb 2009 10:26:05 +0100
Subject: [Buildroot] Urgent : at91rm9200 root file system
In-Reply-To: <1234171137.4559.67.camel@linux-l8en.site> (Sandeep Kumar's
	message of "Mon\, 09 Feb 2009 14\:48\:57 +0530")
References: <498A1FA9.1070306@ethertek.ca> <878woldc0r.fsf@macbook.be.48ers.dk>
	<1233814769.5851.73.camel@linux-l8en.site>
	<87r62dauce.fsf@macbook.be.48ers.dk>
	<1233920929.4559.12.camel@linux-l8en.site>
	<87d4dvaij4.fsf@macbook.be.48ers.dk>
	<1233924549.4559.17.camel@linux-l8en.site>
	<87zlgz91gc.fsf@macbook.be.48ers.dk>
	<1233928454.4559.27.camel@linux-l8en.site>
	<498C5579.10007@ethertek.ca>
	<1233935456.4559.36.camel@linux-l8en.site>
	<498C5F12.4060904@ethertek.ca>
	<1234171137.4559.67.camel@linux-l8en.site>
Message-ID: <87bptc7yhe.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sandeep" == Sandeep Kumar <sandeepk@verismonetworks.com> writes:

 Sandeep> Hi Pattison I have downloaded buildroot package configured
 Sandeep> it for at91rm9200 and in the make i am getting an error
 Sandeep> which i was unable to fix. Can you please

 Sandeep> checking for suffix of object files... configure: error: cannot compute
 Sandeep> suffix of object files: cannot compile
 Sandeep> See `config.log' for more details.
 Sandeep> make[1]: *** [configure-target-libgcc] Error 1

You're using Ubuntu and don't have mpfr/gmpc installed on the host,
right? I'm looking into the problem right now.

-- 
Bye, Peter Korsgaard
