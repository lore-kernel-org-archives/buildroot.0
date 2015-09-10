From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 22:07:03 +0200
Subject: [Buildroot] [PATCH] system: make systemd's kernel headers
	comment fit
In-Reply-To: <1441904157-19302-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Thu, 10 Sep 2015 18:55:57 +0200")
References: <1441904157-19302-1-git-send-email-arnout@mind.be>
Message-ID: <87oahaf388.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > The comment line that explains that systemd needs a glibc toolchain and
 > kernel headers >= 3.10 doesn't fit in the dialog box, which makes it
 > look as if headers >= 3.1 are needed.

 > Abbreviate the comment a little by removing an 'an'. It still doesn't
 > fit completely (only one trailing * is shown), but at least it's
 > readable.

 > While we're at it, change the quoting style to " like we always use.

 > Reported-by: eschu on IRC
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
