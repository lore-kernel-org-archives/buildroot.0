From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Mar 2013 08:57:29 +0100
Subject: [Buildroot] [PATCH] openswan: add missing TARGET_MAKE_ENV
In-Reply-To: <1364197915-10874-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 25 Mar 2013 08:51:55 +0100")
References: <1364197915-10874-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87obe7ewt2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> openswan needs host-bison. The dependency was already there, but the
 Thomas> build was not executed with $(TARGET_MAKE_ENV) in the environment, and
 Thomas> therefore $(HOST_DIR)/usr/bin was not in the PATH.

 Thomas> While we're at it, add licensing informations to openswan.

Committed, thanks.

-- 
Bye, Peter Korsgaard
