From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Feb 2014 21:59:40 +0100
Subject: [Buildroot] [PATCHv1 05/26] pkg-python: simplifications after
	the Python 2.x bump
In-Reply-To: <1392324555-29246-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 13 Feb 2014 21:48:54 +0100")
References: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392324555-29246-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8761ohl8ar.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Thanks to the Python 2.x bump, it is no longer needed to pass
 > PYTHONCPREFIX, and CROSS_COMPILING when building third-party Python
 > modules.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
