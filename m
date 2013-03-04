From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Mar 2013 21:19:58 +0100
Subject: [Buildroot] [PATCH 1/2] ncurses: speed up the build by not
	installing manpages
In-Reply-To: <1361726871-18016-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Feb 2013 18:27:50 +0100")
References: <1361726871-18016-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wqtm9att.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The installation of manpages during the installation step of
 Thomas> host-ncurses and ncurses is horribly slow, and useless. This commit
 Thomas> therefore disables the installation of those manpages, using the
 Thomas> --without-manpages configuration option.

 Thomas> It brings the combined host-ncurses+ncurses configure/build/install
 Thomas> time from 3 minutes and 18 seconds to 1 minute and 36 seconds.

Cool, committed both, thanks.

-- 
Bye, Peter Korsgaard
