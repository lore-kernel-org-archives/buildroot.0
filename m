From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 31 May 2014 09:24:00 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-30
In-Reply-To: <20140531063006.13FE6101026@stock.ovh.net> (Thomas Petazzoni's
 message of "Sat, 31 May 2014 08:30:06 +0200 (CEST)")
References: <20140531063006.13FE6101026@stock.ovh.net>
Message-ID: <878upi76nj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Build statistics for 2014-05-30
 > ===============================

 >         success : 99 
 >        failures : 1  
 >        timeouts : 0  
 >           TOTAL : 100

Wee! Just one to go!

 > Classification of failures by reason
 > ====================================

 >                qt5webkit-5.2.1 | 1 

 > Detail of failures
 > ===================

 >        arm |                qt5webkit-5.2.1 | NOK | http://autobuild.buildroot.net/results/dbe4e8f7b7ddd8ab3fdc1a6f41d775b3c8132160/

The WebKit build was disabled for the following reasons: 
    * Missing flex from PATH 

I'll add host-flex as a dependency.

-- 
Bye, Peter Korsgaard
