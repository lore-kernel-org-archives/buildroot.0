From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Feb 2014 22:07:55 +0100
Subject: [Buildroot] [PATCH 1/2] tvheadend: fix error compiling with
	ccache
In-Reply-To: <1392989961-18289-1-git-send-email-martin@barkynet.com> (Martin
 Bark's message of "Fri, 21 Feb 2014 13:39:20 +0000")
References: <1392989961-18289-1-git-send-email-martin@barkynet.com>
Message-ID: <87bny0uqc4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > The tvheadend configure script fails to correctly handle spaces in any of
 > the options passed to it.  If ccache is used the configure script fails to
 > handle the space in the --cc option and errors.  Also the --cflags option
 > fails to handle multiple entries and only uses the first one.  This patch
 > simple removes setting the --cc and --cflags options as the configure
 > script will correctly use the CC and CFLAGS variables already passed in
 > TARGET_CONFIGURE_OPTS.

 > Signed-off-by: Martin Bark <martin@barkynet.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Committed, thanks.

Is there supposed to be a patch 2/2 somewhere?

-- 
Bye, Peter Korsgaard
