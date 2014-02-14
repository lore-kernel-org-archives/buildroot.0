From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Feb 2014 21:52:48 +0100
Subject: [Buildroot] [PATCHv1 01/26] python: expose PYTHON_PATH
In-Reply-To: <1392324555-29246-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 13 Feb 2014 21:48:50 +0100")
References: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392324555-29246-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwhtl8m7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > As a preparation to make the Python infrastructure support both Python
 > and Python 3, as well as the bump of Python 2 and 3, we need the
 > Python package to expose the Python module path in a variable called
 > PYTHON_PATH. It will be used by the following commits.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
