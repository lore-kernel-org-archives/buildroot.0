From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Feb 2014 22:03:02 +0100
Subject: [Buildroot] [PATCHv1 07/26] pkg-python: no longer use
	distutilscross for setuptools
In-Reply-To: <1392324555-29246-8-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 13 Feb 2014 21:48:56 +0100")
References: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392324555-29246-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wqgxjtkp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Thanks to the bump of Python 2.x, distutilscross is no longer needed
 > to achieve cross-compilation for setuptools packages. The host Python
 > 2.x interpreter can be tricked into using the target compiler thanks
 > to pointing it to a different sysconfigdata module, which is achieved
 > using PYTHON_PATH.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This no longer applies after Fabio's parallel make series. Could you
please rebase and send a v2?

-- 
Bye, Peter Korsgaard
