From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Feb 2009 15:28:27 +0100
Subject: [Buildroot] can't open /dev/tty No such device or address
In-Reply-To: <1233667508.7844.5.camel@penguin> (jeff angielski's message of
	"Tue\, 03 Feb 2009 08\:25\:08 -0500")
References: <1233613745.7613.23.camel@penguin>
	<20090202232422.GB30540@cloud.net.au>
	<1233633829.13156.3.camel@penguin>
	<87pri0f1gr.fsf@macbook.be.48ers.dk> <1233667508.7844.5.camel@penguin>
Message-ID: <87wsc7egs4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "jeff" == jeff angielski <jeff@theptrgroup.com> writes:

 jeff> Here is what I added to the device_table.txt to make it work.

 jeff> /dev/ttyCPM c	666	0	0	204	46	0	1	6

6 nodes? devices.txt seems a bit broken in this regard, but it seems
like only the region 46..49 has been reserved for cpm.

I've updated the generic device_table.txt / securetty with
ttyCPM[0-3].

-- 
Bye, Peter Korsgaard
