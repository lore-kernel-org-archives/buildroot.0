From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Feb 2014 22:57:51 +0100
Subject: [Buildroot] [PATCH v2 01/20] pkg-python: no longer use
	distutilscross for setuptools
In-Reply-To: <1392756013-27757-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 18 Feb 2014 21:39:54 +0100")
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392756013-27757-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k3cs3wyo.fsf@dell.be.48ers.dk>
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

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
