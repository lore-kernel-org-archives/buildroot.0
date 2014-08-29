From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 Aug 2014 09:58:10 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-autotools: use
	--disable-dependency-tracking
In-Reply-To: <20140829092150.04986069@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 29 Aug 2014 09:21:50 +0200")
References: <1409259825-619-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87tx4vrcg8.fsf@dell.be.48ers.dk>
 <20140829092150.04986069@free-electrons.com>
Message-ID: <87lhq7ralp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> 3% isn't much, but OK - Committed both to next, thanks.

 > Well, I was indeed a bit disappointed by the small difference. But I
 > believe it anyway makes more sense than having a few random packages
 > pass --disable-dependency-tracking.

 > Also, as we say in French, "les petits ruisseaux font les grandes
 > rivi?res", which could roughly be translated as "the small streams make
 > the big rivers". Everything counts :-)

Yeah. In Danish it is 'Mange b?kke sm? g?r en stor ?' ;)

-- 
Bye, Peter Korsgaard
