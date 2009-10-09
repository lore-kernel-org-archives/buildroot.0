From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Oct 2009 14:51:00 +0200
Subject: [Buildroot] [PATCH 13/23] qt: use configure option instead a
	sed hack to disable xinerama
In-Reply-To: <1254907246-5650-14-git-send-email-mroth@nessie.de> (Michael
	Roth's message of "Wed\, 7 Oct 2009 11\:20\:36 +0200")
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-14-git-send-email-mroth@nessie.de>
Message-ID: <87y6nkennv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Roth <mroth@nessie.de> writes:

 Michael> The Qt configure script gained the option '-no-xinerama' in the
 Michael> meantime. So use it instead hacking the script itself using sed.

Committed, thanks.

-- 
Bye, Peter Korsgaard
