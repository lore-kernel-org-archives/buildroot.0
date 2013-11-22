From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Nov 2013 13:07:34 +0100
Subject: [Buildroot] [PATCH v2] libcap-ng: disable on avr32 which lacks
	TLS
In-Reply-To: <1385112407-3569-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Fri, 22 Nov 2013 10:26:47 +0100")
References: <1385112407-3569-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87fvqoprll.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > libcap-ng needs TLS support, which is not available on avr32.
 > Also, disable reverse dependencies.

 > Fixes:
 >   http://autobuild.buildroot.net/results/73c/73c7c211a51c312bbe4eb6a540f3ad9c92c79ebe/

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 > ---
 > changes v1 -> v2:
 > - add the 'depends on' statement to the ofono comment (ThomasP)

Committed, thanks.

-- 
Bye, Peter Korsgaard
