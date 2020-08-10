From: Andreas Hilse <andreas.hilse@ipcomm.de>
Date: Mon, 10 Aug 2020 10:39:06 +0200 (CEST)
Subject: [Buildroot] sysklogd 1.6: messages from klogd are logged to
 user facility
In-Reply-To: <008501d66bd6$7ac48080$704d8180$@ipcomm.de>
References: <01bd01d66b51$a7eba690$f7c2f3b0$@ipcomm.de>
 <20200805225153.7e4bb864@windsurf.home>
 <008501d66bd6$7ac48080$704d8180$@ipcomm.de>
Message-ID: <006a01d66ef1$b5af8140$210e83c0$@ipcomm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Latest sysklogd 2.1.2 fixes the issue.

I'm trying to upgrade the sysklogd package and like to clarify some things
before submitting a patch.

Package now provides its own logger tool which could interfere with the
same from busybox or util-linux.
I already made it a selectable option in the Config.in but is there
anything to be done concerning busybox/util-linux?

klogd has been removed from the package, functionality is now in syslogd.

Best regards
Andreas
