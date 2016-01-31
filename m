From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 10:29:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/net-tools: bump version to fix
	musl build
In-Reply-To: <1454228543-8101-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Sun, 31 Jan 2016 09:22:23 +0100")
References: <1454228543-8101-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87io2ajdvo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > git head includes this commit
 > http://sourceforge.net/p/net-tools/code/ci/c35607eae8243851dd80a0181554f3a0e9e50aa8/

 > Due to the gettext problems the package-specific build errors were not
 > yet found by the autobuilders:

 > slattach.c:85:11: error: ?B50? undeclared here (not in a function)
 >    { "50", B50 }, { "75", B75   },
 > (and many more)

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
