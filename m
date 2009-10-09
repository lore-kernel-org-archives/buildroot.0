From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Oct 2009 14:55:05 +0200
Subject: [Buildroot] [PATCH 16/23] qt: disable precompiled headers when
	ccache is enabled
In-Reply-To: <1254907246-5650-17-git-send-email-mroth@nessie.de> (Michael
	Roth's message of "Wed\, 7 Oct 2009 11\:20\:39 +0200")
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-17-git-send-email-mroth@nessie.de>
Message-ID: <87pr8wenh2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Roth <mroth@nessie.de> writes:

 Michael> ccache and precompiled headers don't work together, so disable
 Michael> precompiled headers when ccache is enabled.

 Michael> The benefit of ccache compiling Qt a second or more time is
 Michael> much higher than the costs of disabled precompiled headers in
 Michael> the first run.

Committed, thanks.

-- 
Bye, Peter Korsgaard
