From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2015 23:07:53 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: Handle whitespace when
	stripping .ko
In-Reply-To: <1431203133-17961-1-git-send-email-erico.nunes@datacom.ind.br>
 (Erico Nunes's message of "Sat, 9 May 2015 17:25:33 -0300")
References: <1431203133-17961-1-git-send-email-erico.nunes@datacom.ind.br>
Message-ID: <87vbg0jg46.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Erico" == Erico Nunes <erico.nunes@datacom.ind.br> writes:

 > It is possible to end up with a path containing spaces if the kernel
 > localversion contains spaces.
 > Be it good practice or not, there are third party vendors which
 > distribute kernel configuration files for reference platforms which have
 > quoted strings containing whitespaces in the localversion.

 > There was already a fix to handle paths with whitespaces or other
 > special characters when running strip, which consists of using the find
 > -print0 and xargs -0 pair of arguments, but the kernel module stripping
 > wasn't included in the fix.
 > This commit includes the same fix to the kernel module stripping line.

 > Signed-off-by: Erico Nunes <erico.nunes@datacom.ind.br>

Committed, thanks.

-- 
Bye, Peter Korsgaard
