From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Feb 2014 21:59:49 +0100
Subject: [Buildroot] [PATCHv1 06/26] core: remove .py/.pyc for Python
In-Reply-To: <1392324555-29246-7-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 13 Feb 2014 21:48:55 +0100")
References: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392324555-29246-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871tz5l8ai.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The main Buildroot Makefile was removing *.py or *.pyc if Python 2 was
 > enabled, but for Python 3, this action was taken care of by a post
 > install target hook of python3.mk, which means it wouldn't work with
 > external modules (the .py/.pyc removal would be done before external
 > Python modules are installed).

 > We fix this by making the global *.py/*.pyc removal in the main
 > Makefile work for both Python 2 and Python 3.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
