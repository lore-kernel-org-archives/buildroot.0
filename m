From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Feb 2014 22:58:02 +0100
Subject: [Buildroot] [PATCH v2 02/20] python-distutilscross: remove
	package that is no longer needed
In-Reply-To: <1392756013-27757-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 18 Feb 2014 21:39:55 +0100")
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392756013-27757-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d2ik3wyd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Thanks to the previous commit that makes distutilscross unecessary for
 > setuptools packages, the host-distutilscross package can now be
 > removed. There is no need for any Config.in.legacy handling, since
 > there is no target variant, or visible Config.in option for
 > host-distutilscross.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
