From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Feb 2014 09:07:52 +0100
Subject: [Buildroot] [PATCH] ramsmp: not available on !MMU, needs fork
In-Reply-To: <1393486210-1391-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 27 Feb 2014 08:30:10 +0100")
References: <1393486210-1391-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fvn5ash3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Fixes:
 >   http://autobuild.buildroot.org/results/aaa/aaa7f8e5ec72ce69805d6c1a5cde5ff47e1c118e/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
