From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 Nov 2012 12:07:47 +0100
Subject: [Buildroot] [PATCH] cups: fix libdir handling
In-Reply-To: <1341957152-19061-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 10 Jul 2012 23:52:32 +0200")
References: <1341957152-19061-1-git-send-email-arnout@mind.be>
Message-ID: <87fw4psk1o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> Cups uses /usr/lib64 if the HOST has it, no matter if it is
 Arnout> cross compiling for a 32bit arch, breaking the build for stuff
 Arnout> looking in /usr/lib.

 Arnout> The fix of commit edd2716c didn't work, it would just force
 Arnout> /usr/lib64 if the target is 64 bit.  Instead, force
 Arnout> installation in /usr/lib regardless of the host.

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
