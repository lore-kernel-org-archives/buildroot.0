From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 May 2016 11:56:59 +0200
Subject: [Buildroot] [PATCH] build: fix umask test
In-Reply-To: <20160530111740.14c24236@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 30 May 2016 11:17:40 +0200")
References: <20160530070635.GA27560@airbook.vandijck-laurijssen.be>
 <87mvn82d50.fsf@dell.be.48ers.dk> <87inxw2cnt.fsf@dell.be.48ers.dk>
 <20160530111740.14c24236@free-electrons.com>
Message-ID: <87eg8j3m38.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 30 May 2016 10:05:58 +0200, Peter Korsgaard wrote:

 >> Sorry, I misremembered. This logic is above the line where we assign
 >> bash to SHELL, so it runs with /bin/sh as shell. On my system, this is
 >> dash and it behaves like bash in this regard. What shell do you use?

 > From the Kurt's previous e-mails, I believe he is using mksh as his
 > shell.

Yes, I noticed as well. I should stop reading my mails in reverse order
;)

-- 
Venlig hilsen,
Peter Korsgaard 
