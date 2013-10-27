From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Oct 2013 08:29:27 +0100
Subject: [Buildroot] [PATCH] freetype: explicitly en/disable dependencies
In-Reply-To: <1382827494-14057-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 27 Oct 2013 00:44:54 +0200")
References: <1382827494-14057-1-git-send-email-arnout@mind.be>
Message-ID: <87r4b7xjc8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > For the target, add --with/out to configure options as needed.
 > For the host, disable everything.

 > This was triggered by a failing build of the host package because it
 > tried to link the shared library with libbz.a, which isn't compiled
 > with -fPIC.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
