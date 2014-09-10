From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Sep 2014 10:04:00 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-09-09
In-Reply-To: <20140910063013.732CF1018B1@stock.ovh.net> (Thomas Petazzoni's
 message of "Wed, 10 Sep 2014 08:30:13 +0200 (CEST)")
References: <20140910063013.732CF1018B1@stock.ovh.net>
Message-ID: <87vbovewb3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Build statistics for 2014-09-09
 > ===============================

 >         success : 264
 >        failures : 45 
 >        timeouts : 4  
 >           TOTAL : 313

Wee!

I now have autobuild-run running on gcc10, gcc16 and gcc20.


 >      nios2 |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/64a7eef2155248146e7f3a55e85fe60bc5b67791/
 >      nios2 |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/00e34a2a52294bef2330c459cf921957e88633e3/

Fixed by Thomas.

Thomas, I btw noticed that your notification script is still using the
old URLs. Perhaps it would be worthwhile to fix that?


 >        arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/be4e19d55b24c00b8b0fd12c9e5d1e9c5d8b0cb3/
 >        arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/24d1701d39b9b73ef98e141d514592845baa4b8e/
 >        arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/de070cd0eda96bbc96fda8e81cb54c0ae71652a5/

needs host-ncurses, fixed in git.


 >       bfin | snowball-hdmiservice-f75c99... | NOK | http://autobuild.buildroot.net/results/1484925122442c4063da6742f6280ccbaa5cbe29/

Needs !static, fixed in git.

-- 
Bye, Peter Korsgaard
