From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Feb 2014 21:58:53 +0100
Subject: [Buildroot] [PATCHv1 03/26] pkg-python: also pass PYTHONPATH
	when building distutils packages
In-Reply-To: <1392324555-29246-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 13 Feb 2014 21:48:52 +0100")
References: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392324555-29246-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87eh35l8c2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > With the upcoming bump of Python 2.x, it will become important that
 > the PYTHONPATH is passed whenever we build third-party packages, be
 > they using the distutils build mechanism, or the setuptools build
 > mechanism. This is because passing PYTHONPATH is what will allow
 > Python to find a special Python module that contains all the
 > compiler/library/headers definitions that are relevant when
 > cross-compiling.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
