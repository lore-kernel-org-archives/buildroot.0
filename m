From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Feb 2014 23:29:55 +0100
Subject: [Buildroot] [PATCH v2 09/20] python3: provide a PYTHON3_PATH
In-Reply-To: <1392756013-27757-10-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 18 Feb 2014 21:40:02 +0100")
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392756013-27757-10-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87eh302gws.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The Python package infrastructure will need the Python 3 package to
 > provide a PYTHON3_PATH environment variable in order to build
 > third-party Python modules.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to next, thanks.

This btw didn't cleanly apply with git am.

-- 
Bye, Peter Korsgaard
