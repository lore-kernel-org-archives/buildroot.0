From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Dec 2013 17:00:10 +0100
Subject: [Buildroot] [PATCH] systemd: Replace busybox' binaries only if
	applicable
In-Reply-To: <1387242894-4966-1-git-send-email-paul@crapouillou.net> (Paul
 Cercueil's message of "Tue, 17 Dec 2013 02:14:54 +0100")
References: <1387242894-4966-1-git-send-email-paul@crapouillou.net>
Message-ID: <87mwjzpiwl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

 > Previously, the package would overwrite busybox' binaries even
 > if Busybox was set in the config as the default init system.

 > Signed-Off-By: Paul Cercueil <paul@crapouillou.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
