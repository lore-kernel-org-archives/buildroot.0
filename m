From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 14:59:19 +0200
Subject: [Buildroot] [PATCH RESEND] package/Makefile.in: Fix dependency
	for selecting uclinux as TARGET_OS
In-Reply-To: <1379927810.16071.2.camel@phoenix> (Axel Lin's message of "Mon,
 23 Sep 2013 17:16:50 +0800")
References: <1379927810.16071.2.camel@phoenix>
Message-ID: <8761fpzbo8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 > Current setting only allows blackfin to select uclinux as TARGET_OS.
 > However, some noMMU ARM platforms that using FLAT binary format also need to
 > select uclinux as TARGET_OS. Fix the dependency.

 > Signed-off-by: Axel Lin <axel.lin@ingics.com>
 > ---
 > This patch was sent on
 > http://lists.busybox.net/pipermail/buildroot/2013-September/077488.html

Committed with some fixups to get it to apply, thanks!

-- 
Bye, Peter Korsgaard
