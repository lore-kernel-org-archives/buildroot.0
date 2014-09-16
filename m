From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Sep 2014 23:03:04 +0200
Subject: [Buildroot] [PATCH 0/8] gdb updates
In-Reply-To: <1410814210-10002-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 15 Sep 2014 22:50:02 +0200")
References: <1410814210-10002-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8738br8eif.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > Here are a bunch of gdb updates:

 >  * Addition of version 7.8, switch to 7.7 as the default one, removal
 >    of version 7.6.

 >  * Addition of the missing host-ncurses dependency to host-gdb.

 >  * Addition of TUI support for the target gdb (patch from Vincent
 >    Stehl?).

 >  * Addition of Python support for the host and target gdb.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
