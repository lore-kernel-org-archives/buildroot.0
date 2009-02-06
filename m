From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Feb 2009 12:53:19 +0100
Subject: [Buildroot] Urgent : at91rm9200 root file system
In-Reply-To: <1233920929.4559.12.camel@linux-l8en.site> (Sandeep Kumar's
	message of "Fri\, 06 Feb 2009 17\:18\:49 +0530")
References: <498A1FA9.1070306@ethertek.ca> <878woldc0r.fsf@macbook.be.48ers.dk>
	<1233814769.5851.73.camel@linux-l8en.site>
	<87r62dauce.fsf@macbook.be.48ers.dk>
	<1233920929.4559.12.camel@linux-l8en.site>
Message-ID: <87d4dvaij4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sandeep" == Sandeep Kumar <sandeepk@verismonetworks.com> writes:

 Sandeep> Hi
 Sandeep> Can antbody tell me from where can i get the root file system (rootfs)
 Sandeep> for my AT91RM9200 board. Its very urgent.

Just build it.

make at91rm9200df_defconfig; make

-- 
Bye, Peter Korsgaard
