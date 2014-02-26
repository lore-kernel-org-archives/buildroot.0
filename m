From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Feb 2014 21:53:42 +0100
Subject: [Buildroot] [PATCH] zyre: remove unnecessary autoreconf options
In-Reply-To: <1393437649-22123-1-git-send-email-spdawson@gmail.com> (Simon
 Dawson's message of "Wed, 26 Feb 2014 18:00:49 +0000")
References: <1393437649-22123-1-git-send-email-spdawson@gmail.com>
Message-ID: <87ob1td295.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon Dawson <spdawson@gmail.com> writes:

 > The default $(PKG)_AUTORECONF_OPT already includes the -i and -f flags,
 > so there is no point in specifying these in the package makefile. Further,
 > the -v option to autoreconf is not required.

 > Signed-off-by: Simon Dawson <spdawson@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
