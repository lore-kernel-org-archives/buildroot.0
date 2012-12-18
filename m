From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Dec 2012 08:38:28 +0100
Subject: [Buildroot] [PATCH] netatalk: fix 64-bit build
In-Reply-To: <1355780891-26657-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Mon, 17 Dec 2012 22:48:11 +0100")
References: <1355780891-26657-1-git-send-email-arnout@mind.be>
Message-ID: <87ip7z7qtn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> The configure script sets LD_LIBRARY_PATH to the staging directory,
 Arnout> which makes the `ls` that is called in one of the tests fail. Fix by
 Arnout> not setting LD_LIBRARY_PATH when cross-compiling.

 Arnout> The patch has been sent upstream.

 Arnout> Also remove the BDB_LIB variable: it isn't used.

Committed, thanks.

-- 
Bye, Peter Korsgaard
