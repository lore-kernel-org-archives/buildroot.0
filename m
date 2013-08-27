From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Aug 2013 22:30:46 +0200
Subject: [Buildroot] [PATCH] apply-patches: run patch in batch mode
In-Reply-To: <1377194533-22501-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Thu, 22 Aug 2013 20:02:13 +0200")
References: <5215C738.2070707@lucaceresoli.net>
 <1377194533-22501-1-git-send-email-arnout@mind.be>
Message-ID: <87eh9ekhah.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> If the file to be patched is missing, then `patch' will interactively
 Arnout> ask for a file to be patched. This is annoying in e.g. the autobuilders
 Arnout> because they have to wait for a timeout instead of failing.

 Arnout> Giving the '-t' (batch mode) option to patch fixes this: it will skip the
 Arnout> missing file, and return a non-zero exit code. So the build cleanly
 Arnout> fails.

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
 Arnout> ---
 Arnout> I actually discovered this during my allyesconfig night build, where I
 Arnout> use make -k.

Committed, thanks.

-- 
Bye, Peter Korsgaard
