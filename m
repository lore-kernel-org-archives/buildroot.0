From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 09 Mar 2013 21:17:42 +0100
Subject: [Buildroot] [PATCH 3/5] libglib2: don't build tests
In-Reply-To: <1362853290-15592-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 9 Mar 2013 19:21:28 +0100")
References: <1362853290-15592-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362853290-15592-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8762102uqh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Add a patch that provides an additional --disable-tests option to the
 Thomas> configure script.

 Thomas> Disabling the build of tests has two benefits:
 Thomas>  * Prevents the build of a lot of code that doesn't build on noMMU
 Thomas>    platforms.
 Thomas>  * Reduces the build time.

Committed, thanks. Please try sending it upstream.

-- 
Bye, Peter Korsgaard
