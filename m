From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Feb 2014 23:22:46 +0100
Subject: [Buildroot] [PATCH v2 07/20] python3: use proper
	PYTHON3_VERSION_MAJOR instead of harcoding 3.3
In-Reply-To: <1392756013-27757-8-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 18 Feb 2014 21:40:00 +0100")
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392756013-27757-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwho2h8p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Some parts of python3.mk were hardcoding the 3.3 version as the major
 > version, which does not work for Python 3.4 and other future
 > versions. Instead, use the existing PYTHON3_VERSION_MAJOR.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
