From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Oct 2009 14:57:19 +0200
Subject: [Buildroot] [PATCH 18/23] qt: remove Kconfig option to enable
	all pixel depths
In-Reply-To: <1254907246-5650-19-git-send-email-mroth@nessie.de> (Michael
	Roth's message of "Wed\, 7 Oct 2009 11\:20\:41 +0200")
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-19-git-send-email-mroth@nessie.de>
Message-ID: <87ljjkendc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Roth <mroth@nessie.de> writes:

 Michael> The Kconfig menu "Pixel depths" of Qt provides a list with all
 Michael> selectable pixel depths and additionally the option "all".

 Michael> When "all" is selected, the list with all available pixel depths
 Michael> disappears.

 Michael> Because this disappearing of available pixel depths makes no sense
 Michael> under usability aspects, simply remove the option "all".

 Michael> The user could enable all available pixel depths by selecting each
 Michael> individual depth anyway. So no functionality is lost.

Committed, thanks.

-- 
Bye, Peter Korsgaard
