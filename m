From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2016 22:26:08 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain-external: CodeSourcery NiosII
	2015.11 affected by PR19405
In-Reply-To: <1455316403-7793-1-git-send-email-romain.naour@gmail.com> (Romain
 Naour's message of "Fri, 12 Feb 2016 23:33:22 +0100")
References: <1455316403-7793-1-git-send-email-romain.naour@gmail.com>
Message-ID: <87fuwrxc3z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/ee562524c5b12191e584ceae89006c5a5103e700

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > ---
 >  package/grantlee/Config.in             | 1 +
 >  package/opencv/Config.in               | 1 +
 >  package/opencv3/Config.in              | 1 +
 >  package/pinentry/Config.in             | 1 +
 >  package/poppler/Config.in              | 1 +
 >  package/qt/Config.in                   | 7 +++++++

Hmm, why are we only adding a comment to qt and not all these other
packages?

It would be good to add a link to the upstream bugtracker in the commit
description / where the kconfig symbol is added.

-- 
Bye, Peter Korsgaard
