From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Feb 2014 21:55:16 +0100
Subject: [Buildroot] [PATCHv1 02/26] pkg-python: use the newly defined
	PYTHON_PATH variable
In-Reply-To: <1392324555-29246-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 13 Feb 2014 21:48:51 +0100")
References: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392324555-29246-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ioshl8i3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Now that the Python package exposes its PYTHON_PATH variable, we can
 > use it in the package infrastructure. This prepares both the upcoming
 > bump of Python 2.x, and the introduction of Python 3 support in the
 > Python package infrastructure.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
