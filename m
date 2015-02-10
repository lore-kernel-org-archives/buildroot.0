From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Feb 2015 09:21:50 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-02-09
In-Reply-To: <20150210073014.E19721010F3@stock.ovh.net> (Thomas Petazzoni's
 message of "Tue, 10 Feb 2015 08:30:14 +0100 (CET)")
References: <20150210073014.E19721010F3@stock.ovh.net>
Message-ID: <87siee18ip.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Build statistics for 2015-02-09
 > ===============================

 >         success : 350
 >        failures : 15 
 >        timeouts : 3  
 >           TOTAL : 368

Nice!

>       mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/d3f123367559c758649c6da0ee4df528cb2d4682/
 >       mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/cd713c2513cd1eb39b657504203338c4b7f5c887/
 >       mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/0220ecb696a742641b83949f187d2d74e442f48a/

Didn't we already blacklist those uClibc/MIPS toolchains?

-- 
Bye, Peter Korsgaard
