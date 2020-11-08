From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Nov 2020 19:11:40 +0100
Subject: [Buildroot] [git commit] systemd: clear telinit path
In-Reply-To: <20201103210517.62F9F86D32@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Tue, 3 Nov 2020 22:17:55 +0100")
References: <20201103210517.62F9F86D32@busybox.osuosl.org>
Message-ID: <87zh3rwwf7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=8bc9350963dddb80a0bf4cfd9ad32807223eae67
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Since we don't enable sysv any support, it makes no sense to set the
 > path to telinit either.

 > The path we were setting was anyway wrong: we set a path into
 > TARGET_DIR, but this path is only used at runtime, on the target, where
 > TARGET_DIR doesn't exist (it should have been /usr/sbin/telinit).

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
