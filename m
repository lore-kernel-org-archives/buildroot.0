From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 02 Jul 2013 23:04:14 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-07-01
In-Reply-To: <20130702093852.123fdc11@skate> (Thomas Petazzoni's message of
 "Tue, 2 Jul 2013 09:38:52 +0200")
References: <20130702063005.2F3D352C121@lolut.humanoidz.org>
 <20130702093852.123fdc11@skate>
Message-ID: <87ppv0smgh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Peter,
 Thomas> On Tue,  2 Jul 2013 08:30:05 +0200 (CEST), Thomas Petazzoni wrote:

 >> Classification of failures by reason
 >> ====================================
 >> 
 >> ltp-testsuite-20130109 | 8 

 Thomas> Can you adjust your build script to not build ltp-testsuite when using
 Thomas> uClibc? It is well known that our default uClibc configuration doesn't
 Thomas> have all the necessary bits to build ltp-testsuite.

Yes, I used to have that, but it must have been dropped by my recent
cleanup / move to gcc20.

Fixed now.

-- 
Bye, Peter Korsgaard
