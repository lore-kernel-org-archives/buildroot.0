From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Jan 2017 21:09:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/ustr: fix ldconfig for host
	build
In-Reply-To: <1484064352-50148-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Tue, 10 Jan 2017 10:05:52 -0600")
References: <1484064352-50148-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87mveyk77l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 > The host build of the ustr package also needs to not run the ldconfig to
 > prevent a build failure caused by the symlink creating a race condition.
 > Related commit for target build change was 22069232.

 > Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
