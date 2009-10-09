From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Oct 2009 14:53:42 +0200
Subject: [Buildroot] [PATCH 15/23] qt: make sure to install all Qt-fonts
	and true-type-fonts
In-Reply-To: <1254907246-5650-16-git-send-email-mroth@nessie.de> (Michael
	Roth's message of "Wed\, 7 Oct 2009 11\:20\:38 +0200")
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-16-git-send-email-mroth@nessie.de>
Message-ID: <87tyy8enjd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Roth <mroth@nessie.de> writes:

 Michael> Qt gained some more qpf-fonts and also provides some
 Michael> true-type-fonts.  Make sure to install them all inclusive
 Michael> ttf-fonts when freetype-support is enabled. Additionally the
 Michael> empty 'fontdir' file is really not needed.

Committed, thanks.

-- 
Bye, Peter Korsgaard
