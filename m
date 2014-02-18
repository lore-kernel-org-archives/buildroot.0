From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Feb 2014 23:23:02 +0100
Subject: [Buildroot] [PATCH v2 08/20] python3: bump to 3.4.0rc1
In-Reply-To: <1392756013-27757-9-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 18 Feb 2014 21:40:01 +0100")
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392756013-27757-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87iosc2h89.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit bumps the Python3 package to use Python 3.4.0rc1.
 > About the patches:

 >  * The patches below 100 are significantly changed, because like for
 >    Python 2.x, a good number of improvements have been made in the
 >    upstream Python for cross-compilation. Therefore, almost all of
 >    these patches have been modified.

 >  * All the patches above 100 are simply updated for Python 3.4.0, with
 >    a small refactoring for the handling of test modules.

 > The details of the python3.mk changes are:

 >  * --without-ensurepip to tell Python to not use PIP and build time.

s/and/at/

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
