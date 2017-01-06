From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Jan 2017 17:07:55 +0100
Subject: [Buildroot] [PATCH] irssi: security bump to 0.8.21
In-Reply-To: <20170106111030.23080-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 6 Jan 2017 12:10:30 +0100")
References: <20170106111030.23080-1-peter@korsgaard.com>
Message-ID: <87zij4rx2c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Bugfixes:
 > - CVE-2017-5193: Correct a NULL pointer dereference in the nickcmp function
 >   found by Joseph Bisch (GL#1)

 > - CVE-2017-5194: Correct an error when receiving invalid nick message (GL#4,
 >   #466)

 > - CVE-2017-5195: Correct an out of bounds read in certain incomplete control
 >   codes found by Joseph Bisch (GL#2)

 > - CVE-2017-5196: Correct an out of bounds read in certain incomplete
 >   character sequences found by Hanno B?ck and independently by J.  Bisch
 >   (GL#3)

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
