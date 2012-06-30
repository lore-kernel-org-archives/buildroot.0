From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jul 2012 00:27:57 +0200
Subject: [Buildroot] [PATCH resend] Globally disable PKG_CONFIG_PATH
In-Reply-To: <1341088162-16689-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 30 Jun 2012 22:29:22 +0200")
References: <1341088162-16689-1-git-send-email-arnout@mind.be>
Message-ID: <87vci8305u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> If PKG_CONFIG_PATH is set in the environment, it allows pkg-config to
 Arnout> look for libraries outside of the buildroot tree.  This is a problem
 Arnout> both for host and target builds.  To avoid it, globally set an empty
 Arnout> PKG_CONFIG_PATH in the environment.

Committed, thanks.

-- 
Bye, Peter Korsgaard
